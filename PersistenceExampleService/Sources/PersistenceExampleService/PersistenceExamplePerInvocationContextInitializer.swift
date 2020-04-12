//
// PersistenceExamplePerInvocationContextInitializer.swift
// PersistenceExampleService
//

import Foundation
import PersistenceExampleModel
import PersistenceExampleOperations
import PersistenceExampleOperationsHTTP1
import SmokeOperationsHTTP1
import SmokeOperationsHTTP1Server
import SmokeAWSCore
import SmokeDynamoDB
import SmokeAWSCredentials
import SmokeAWSHttp
import AsyncHTTPClient
import NIO

typealias PersistenceExampleOperationDelegate = JSONPayloadHTTP1OperationDelegate<SmokeInvocationTraceContext>

/**
 Initializer for the PersistenceExampleService.
 */
struct PersistenceExamplePerInvocationContextInitializer: SmokeServerPerInvocationContextInitializer {
    typealias SelectorType =
        StandardSmokeHTTP1HandlerSelector<PersistenceExampleOperationsContext, PersistenceExampleOperationDelegate,
                                          PersistenceExampleModelOperations>
    let dynamodbTableGenerator: AWSDynamoDBCompositePrimaryKeyTableGenerator
    let credentialsProvider: StoppableCredentialsProvider
    let awsClientInvocationTraceContext = AWSClientInvocationTraceContext()
    let handlerSelector: SelectorType

    // TODO: Add properties to be accessed by the operation handlers

    /**
     On application startup.
     */
    init(eventLoop: EventLoop) throws {
        CloudwatchStandardErrorLogger.enableLogging()
        
        let environment = EnvironmentVariables.getEnvironment()
        
        let clientEventLoopProvider = HTTPClient.EventLoopGroupProvider.shared(eventLoop)
        
        guard let credentialsProvider = AwsContainerRotatingCredentialsProvider.get(
                fromEnvironment: environment,
                eventLoopProvider: clientEventLoopProvider) else {
            throw PersistenceExampleServiceError.unableToObtainCredentialsFromContainerEnvironment
        }
        
        self.credentialsProvider = credentialsProvider
        
        let region = try environment.getRegion()

        self.dynamodbTableGenerator = try PersistenceExamplePerInvocationContextInitializer.initializeDynamoDBTableGeneratorFromEnvironment(
                environment: environment,
                credentialsProvider: credentialsProvider,
                region: region,
                clientEventLoopProvider: clientEventLoopProvider)

        var selector = SelectorType(defaultOperationDelegate: JSONPayloadHTTP1OperationDelegate())
        addOperations(selector: &selector)

        self.handlerSelector = selector
    }
    
    func timestampGenerator() -> String {
        "\(Date().timeIntervalSinceReferenceDate)"
    }

    func idGenerator() -> String {
        UUID().uuidString
    }

    private static func initializeDynamoDBTableGeneratorFromEnvironment(
        environment: [String: String],
        credentialsProvider: CredentialsProvider,
        region: AWSRegion,
        clientEventLoopProvider: HTTPClient.EventLoopGroupProvider) throws -> AWSDynamoDBCompositePrimaryKeyTableGenerator {
        let dynamoEndpointHostName = try environment.get(EnvironmentVariables.dynamoEndpointHostName)
        let dynamoTableName = try environment.get(EnvironmentVariables.dynamoTableName)

        return AWSDynamoDBCompositePrimaryKeyTableGenerator(
            credentialsProvider: credentialsProvider,
            region: region, endpointHostName: dynamoEndpointHostName,
            tableName: dynamoTableName,
            eventLoopProvider: clientEventLoopProvider)
    }

    /**
     On invocation.
    */
    public func getInvocationContext(
        invocationReporting: SmokeServerInvocationReporting<SmokeInvocationTraceContext>) -> PersistenceExampleOperationsContext {
        let awsClientInvocationReporting = invocationReporting.withInvocationTraceContext(traceContext: awsClientInvocationTraceContext)
        let dynamodbTable = self.dynamodbTableGenerator.with(reporting: awsClientInvocationReporting)
        
        return PersistenceExampleOperationsContext(
            dynamodbTable: dynamodbTable,
            idGenerator: self.idGenerator,
            timestampGenerator: self.timestampGenerator,
            logger: invocationReporting.logger)
    }

    /**
     On application shutdown.
    */
    func onShutdown() throws {
        try self.dynamodbTableGenerator.close()
        try self.credentialsProvider.stop()
    }
}

enum PersistenceExampleServiceError: Swift.Error {
    case unableToObtainCredentialsFromContainerEnvironment
    case missingEnvironmentVariable(reason: String)
    case invalidEnvironmentVariable(reason: String)
}

private struct EnvironmentVariables {
    static let dynamoEndpointHostName = "DYNAMO_ENDPOINT_HOST_NAME"
    static let dynamoTableName = "DYNAMO_TABLE_NAME"
    static let region = "REGION"
    
    static func getEnvironment() -> [String: String] {
        #if DEBUG
        let environment = [EnvironmentVariables.dynamoEndpointHostName: "dynamodb.us-west-2.amazonaws.com",
                           EnvironmentVariables.dynamoTableName: "ServiceStack-PersistenceExampleTable",
                           EnvironmentVariables.region: "us-west-2",
                           AwsContainerRotatingCredentialsProvider.devIamRoleArnEnvironmentVariable:
                               "arn:aws:iam::000000000000:role/EcsTaskExecutionRole"]
        #else
        let environment = ProcessInfo.processInfo.environment
        #endif
        
        return environment
    }
}

private extension Dictionary where Key == String, Value == String {
    func get(_ key: String) throws -> String {
        guard let value = self[key] else {
            throw PersistenceExampleServiceError.missingEnvironmentVariable(reason:
                "'\(key)' environment variable not specified.")
        }
        
        return value
    }
    
    func getRegion() throws -> AWSRegion {
        let regionString = try get(EnvironmentVariables.region)
        
        guard let region = AWSRegion(rawValue: regionString) else {
            throw PersistenceExampleServiceError.invalidEnvironmentVariable(reason:
                "Specified '\(EnvironmentVariables.region)' environment variable '\(regionString)' not a valid region.")
        }
        
        return region
    }
}
