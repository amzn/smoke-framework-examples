//
// PersistenceExamplePerInvocationContextInitializer.swift
// PersistenceExampleService
//

import Foundation
import PersistenceExampleOperations
import PersistenceExampleOperationsHTTP1
import SmokeOperationsHTTP1
import SmokeAWSCore
import SmokeDynamoDB
import SmokeAWSCredentials
import SmokeAWSHttp
import AsyncHTTPClient
import NIO
import Logging

/**
 Initializer for the PersistenceExampleService.
 */
@main
struct PersistenceExamplePerInvocationContextInitializer: PersistenceExamplePerInvocationContextInitializerProtocol {
    let dynamodbTableGenerator: AWSDynamoDBCompositePrimaryKeyTableGenerator
    let credentialsProvider: StoppableCredentialsProvider
    let awsClientInvocationTraceContext = AWSClientInvocationTraceContext()

    /**
     On application startup.
     */
    init(eventLoopGroup: EventLoopGroup) async throws {
        CloudwatchStandardErrorLogger.enableLogging()
        
        let environment = EnvironmentVariables.getEnvironment()
        
        let clientEventLoopProvider = HTTPClient.EventLoopGroupProvider.shared(eventLoopGroup)
        
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
    }
    
    func timestampGenerator() -> String {
        "\(Date().timeIntervalSinceReferenceDate)"
    }

    func idGenerator() -> String {
        UUID().uuidString
    }
    
    func mutateRequestMiddleware(middleware: inout MiddlewareStackType) {
        middleware.finalizePhase.intercept(with: RetriableOutwardsRequestAggregatorMiddleware())
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
    public func getInvocationContext(request: SmokeHTTPServerInvocationRequest) -> PersistenceExampleOperationsContext {
        // the client should (?) get the logger from a task local
        let logger = request.logger ?? Logger(label: "RequestLogger")
        let dynamodbTable = self.dynamodbTableGenerator.with(logger: logger)
        
        return PersistenceExampleOperationsContext(
            dynamodbTable: dynamodbTable,
            idGenerator: self.idGenerator,
            timestampGenerator: self.timestampGenerator,
            logger: logger)
    }

    /**
     On application shutdown.
    */
    func onShutdown() async throws {
        try await self.dynamodbTableGenerator.shutdown()
        try await self.credentialsProvider.shutdown()
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
                           EnvironmentVariables.dynamoTableName: "PersistenceExampleTable",
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
