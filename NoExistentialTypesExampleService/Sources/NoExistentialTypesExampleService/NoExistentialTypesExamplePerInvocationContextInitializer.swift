//
// NoExistentialTypesExamplePerInvocationContextInitializer.swift
// NoExistentialTypesExampleService
//

import Foundation
import NoExistentialTypesExampleOperations
import NoExistentialTypesExampleOperationsHTTP1
import SmokeOperationsHTTP1Server
import SmokeAWSCore
import SmokeDynamoDB
import SmokeAWSCredentials
import SmokeAWSHttp
import AsyncHTTPClient
import SmokeHTTPClient
import DynamoDBModel
import NIO

/**
 Initializer for the NoExistentialTypesExampleService.
 */
@main
struct NoExistentialTypesExamplePerInvocationContextInitializer: NoExistentialTypesExamplePerInvocationContextInitializerProtocol {
    let dynamodbTableOperationsClient: AWSDynamoDBTableOperationsClient
    let credentialsProvider: StoppableCredentialsProvider
    
    private static let dynamodbClientConnectionTimeoutSeconds: Int64 = 5
    private static let dynamodbClientReadTimeoutSeconds: Int64 = 3
    private static let dynamodbClientBaseRetryIntervalMs: RetryInterval = 100
    private static let connectionPoolConfiguration = HTTPClient.Configuration.ConnectionPool(
        idleTimeout: .seconds(60),
        concurrentHTTP1ConnectionsPerHostSoftLimit: 50)
    private static let dynamodbClientTimeoutConfiguration = HTTPClient.Configuration.Timeout(
        connect: .seconds(dynamodbClientConnectionTimeoutSeconds),
        read: .seconds(dynamodbClientReadTimeoutSeconds))

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
            throw NoExistentialTypesExampleServiceError.unableToObtainCredentialsFromContainerEnvironment
        }
        
        self.credentialsProvider = credentialsProvider
        
        let awsRegion = try environment.getRegion()

        self.dynamodbTableOperationsClient = try Self.initializeDynamoDBTableOperationsClientFromEnvironment(
                environment: environment,
                credentialsProvider: credentialsProvider,
                awsRegion: awsRegion,
                clientEventLoopProvider: clientEventLoopProvider)
    }
    
    func timestampGenerator() -> String {
        "\(Date().timeIntervalSinceReferenceDate)"
    }

    func idGenerator() -> String {
        UUID().uuidString
    }

    private static func initializeDynamoDBTableOperationsClientFromEnvironment(
        environment: [String: String],
        credentialsProvider: CredentialsProvider,
        awsRegion: AWSRegion,
        clientEventLoopProvider: HTTPClient.EventLoopGroupProvider) throws
    -> AWSDynamoDBTableOperationsClient {
        let dynamodbTableName = try environment.get(EnvironmentVariables.dynamoTableName)

        // for the DynamoDB clients, only emit the retry count metric
        let reportingConfiguration = SmokeAWSClientReportingConfiguration<DynamoDBModelOperations>(
            successCounterMatchingOperations: .none,
            failure5XXCounterMatchingOperations: .none,
            failure4XXCounterMatchingOperations: .none,
            retryCountRecorderMatchingOperations: .all,
            latencyTimerMatchingOperations: .all)

        let retryConfiguration = HTTPClientRetryConfiguration(numRetries: HTTPClientRetryConfiguration.default.numRetries,
                                                              baseRetryInterval: Self.dynamodbClientBaseRetryIntervalMs,
                                                              maxRetryInterval: HTTPClientRetryConfiguration.default.maxRetryInterval,
                                                              exponentialBackoff: HTTPClientRetryConfiguration.default.exponentialBackoff)
        
        return AWSDynamoDBTableOperationsClient(
            tableName: dynamodbTableName,
            credentialsProvider: credentialsProvider,
            awsRegion: awsRegion,
            ignoreInvocationEventLoop: true,
            timeoutConfiguration: Self.dynamodbClientTimeoutConfiguration,
            retryConfiguration: retryConfiguration,
            eventLoopProvider: clientEventLoopProvider,
            reportingConfiguration: reportingConfiguration,
            connectionPoolConfiguration: Self.connectionPoolConfiguration)
    }

    /**
     On invocation.
    */
    public func getInvocationContext(invocationReporting: SmokeServerInvocationReporting<SmokeInvocationTraceContext>)
    -> HTTPNoExistentialTypesExampleOperationsContext {
        let dynamodbTable = AWSDynamoDBCompositePrimaryKeyTable(
            operationsClient: self.dynamodbTableOperationsClient, invocationAttributes: invocationReporting)
        
        return NoExistentialTypesExampleOperationsContext(
            dynamodbTable: dynamodbTable,
            idGenerator: self.idGenerator,
            timestampGenerator: self.timestampGenerator,
            logger: invocationReporting.logger)
    }

    /**
     On application shutdown.
    */
    func onShutdown() async throws {
        try await self.dynamodbTableOperationsClient.shutdown()
        try await self.credentialsProvider.shutdown()
    }
}

enum NoExistentialTypesExampleServiceError: Swift.Error {
    case unableToObtainCredentialsFromContainerEnvironment
    case missingEnvironmentVariable(reason: String)
    case invalidEnvironmentVariable(reason: String)
}

private struct EnvironmentVariables {
    static let dynamoTableName = "DYNAMO_TABLE_NAME"
    static let region = "REGION"
    
    static func getEnvironment() -> [String: String] {
        #if DEBUG
        let environment = [EnvironmentVariables.dynamoTableName: "NoExistentialTypesExampleTable",
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
            throw NoExistentialTypesExampleServiceError.missingEnvironmentVariable(reason:
                "'\(key)' environment variable not specified.")
        }
        
        return value
    }
    
    func getRegion() throws -> AWSRegion {
        let regionString = try get(EnvironmentVariables.region)
        
        guard let region = AWSRegion(rawValue: regionString) else {
            throw NoExistentialTypesExampleServiceError.invalidEnvironmentVariable(reason:
                "Specified '\(EnvironmentVariables.region)' environment variable '\(regionString)' not a valid region.")
        }
        
        return region
    }
}
