//
// PersistenceExamplePerInvocationContextInitializer.swift
// PersistenceExampleService
//

import Foundation
import PersistenceExampleOperations
import PersistenceExampleOperationsHTTP1
import SmokeOperationsHTTP1Server
import SmokeAWSCore
import SmokeDynamoDB
import AsyncHTTPClient
import NIO
import AWSDynamoDB
import AWSClientRuntime

/**
 Initializer for the PersistenceExampleService.
 */
@main
struct PersistenceExamplePerInvocationContextInitializer: PersistenceExamplePerInvocationContextInitializerProtocol {
    let dynamoDbClient: AWSDynamoDB.DynamoDbClient
    let dynamodbTableName: String

    /**
     On application startup.
     */
    init(eventLoopGroup: EventLoopGroup) async throws {
        CloudwatchStandardErrorLogger.enableLogging()
        
        let environment = EnvironmentVariables.getEnvironment()

        self.dynamoDbClient = try await AWSDynamoDB.DynamoDbClient()
        self.dynamodbTableName = try environment.get(EnvironmentVariables.dynamoTableName)
    }
    
    func timestampGenerator() -> String {
        "\(Date().timeIntervalSinceReferenceDate)"
    }

    func idGenerator() -> String {
        UUID().uuidString
    }

    /**
     On invocation.
    */
    public func getInvocationContext(invocationReporting: SmokeServerInvocationReporting<SmokeInvocationTraceContext>)
    -> PersistenceExampleOperationsContext {
        let dynamodbTable = AWSDynamoDBCompositePrimaryKeyTable(
            dynamoDbClient: self.dynamoDbClient,
            tableName: self.dynamodbTableName,
            logger: invocationReporting.logger)
        
        return PersistenceExampleOperationsContext(
            dynamodbTable: dynamodbTable,
            idGenerator: self.idGenerator,
            timestampGenerator: self.timestampGenerator,
            logger: invocationReporting.logger)
    }

    /**
     On application shutdown.
    */
    func onShutdown() async throws {
        // nothing to do
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
        let environment = [EnvironmentVariables.dynamoTableName: "PersistenceExampleTable"]
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
}
