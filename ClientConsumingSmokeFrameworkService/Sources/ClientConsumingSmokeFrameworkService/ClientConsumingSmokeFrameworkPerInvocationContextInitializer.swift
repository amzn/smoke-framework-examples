//
// ClientConsumingSmokeFrameworkPerInvocationContextInitializer.swift
// ClientConsumingSmokeFrameworkService
//

import Foundation
import ClientConsumingSmokeFrameworkOperations
import ClientConsumingSmokeFrameworkOperationsHTTP1
import SmokeOperationsHTTP1Server
import AWSLogging
import NIO
import SmokeAWSCredentials
import AsyncHTTPClient
import SmokeHTTPClient
import AWSCore
import OtherClient
import OtherModel

enum ClientConsumingSmokeFrameworkServiceError: Swift.Error {
    case unableToObtainCredentialsFromContainerEnvironment
    case missingEnvironmentVariable(reason: String)
    case invalidEnvironmentVariable(reason: String)
}
            
/**
 Initializer for the ClientConsumingSmokeFrameworkService.
 */
@main
struct ClientConsumingSmokeFrameworkPerInvocationContextInitializer: ClientConsumingSmokeFrameworkPerInvocationContextInitializerProtocol {
    let credentialsProvider: StoppableCredentialsProvider
    let otherOperationsClient: APIGatewayOtherOperationsClient
    
    private static let connectionPoolConfiguration = HTTPClient.Configuration.ConnectionPool(
        idleTimeout: .seconds(60),
        concurrentHTTP1ConnectionsPerHostSoftLimit: 50)

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
            throw ClientConsumingSmokeFrameworkServiceError.unableToObtainCredentialsFromContainerEnvironment
        }
        
        self.credentialsProvider = credentialsProvider
        
        let awsRegion = try environment.getRegion()
        
        self.otherOperationsClient = try Self.initializeOtherOperationsClientFromEnvironment(
                environment: environment,
                credentialsProvider: credentialsProvider,
                awsRegion: awsRegion,
                clientEventLoopProvider: clientEventLoopProvider)
    }
    
    private static func initializeOtherOperationsClientFromEnvironment(
        environment: [String: String],
        credentialsProvider: CredentialsProvider,
        awsRegion: AWSRegion,
        clientEventLoopProvider: HTTPClient.EventLoopGroupProvider) throws
    -> APIGatewayOtherOperationsClient {
        let otherServiceEndpointHostName = try environment.get(EnvironmentVariables.otherServiceEndpointHostName)

        // only emit the retry count metric
        let reportingConfiguration = HTTPClientReportingConfiguration<OtherModelOperations>(
            successCounterMatchingOperations: .none,
            failure5XXCounterMatchingOperations: .none,
            failure4XXCounterMatchingOperations: .none,
            retryCountRecorderMatchingOperations: .all,
            latencyTimerMatchingOperations: .all)

        
        return APIGatewayOtherOperationsClient(
            credentialsProvider: credentialsProvider,
            awsRegion: awsRegion,
            endpointHostName: otherServiceEndpointHostName,
            ignoreInvocationEventLoop: true,
            connectionPoolConfiguration: Self.connectionPoolConfiguration,
            eventLoopProvider: clientEventLoopProvider,
            reportingConfiguration: reportingConfiguration)
    }

    /**
     On invocation.
    */
    public func getInvocationContext(invocationReporting: SmokeServerInvocationReporting<SmokeInvocationTraceContext>)
    -> HTTPClientConsumingSmokeFrameworkOperationsContext {
        let otherClient = APIGatewayOtherClient(
            operationsClient: self.otherOperationsClient, invocationAttributes: invocationReporting)
        
        return ClientConsumingSmokeFrameworkOperationsContext(otherClient: otherClient,
                                                              logger: invocationReporting.logger)
    }

    /**
     On application shutdown.
    */
    func onShutdown() async throws {
        try await self.otherOperationsClient.shutdown()
        try await self.credentialsProvider.shutdown()
    }
}

private struct EnvironmentVariables {
    static let otherServiceEndpointHostName = "OTHER_SERVICE_ENDPOINT_HOST_NAME"
    static let region = "REGION"
    
    static func getEnvironment() -> [String: String] {
        #if DEBUG
        let environment = [EnvironmentVariables.otherServiceEndpointHostName: "other.service.somewhere.com",
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
            throw ClientConsumingSmokeFrameworkServiceError.missingEnvironmentVariable(reason:
                "'\(key)' environment variable not specified.")
        }
        
        return value
    }
    
    func getRegion() throws -> AWSRegion {
        let regionString = try get(EnvironmentVariables.region)
        
        guard let region = AWSRegion(rawValue: regionString) else {
            throw ClientConsumingSmokeFrameworkServiceError.invalidEnvironmentVariable(reason:
                "Specified '\(EnvironmentVariables.region)' environment variable '\(regionString)' not a valid region.")
        }
        
        return region
    }
}
