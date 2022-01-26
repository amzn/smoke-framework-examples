// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
// swiftlint:disable type_body_length function_body_length generic_type_name cyclomatic_complexity
// -- Generated Code; do not edit --
//
// APIGatewayEmptyExampleClientGenerator.swift
// EmptyExampleClient
//

import Foundation
import EmptyExampleModel
import SmokeAWSCore
import SmokeHTTPClient
import SmokeAWSHttp
import NIO
import NIOHTTP1
import AsyncHTTPClient
import Logging
import SmokeOperationsHTTP1

/**
 API Gateway Client Generator for the EmptyExample service.
 */
public struct APIGatewayEmptyExampleClientGenerator {
    let httpClient: HTTPOperationsClient
    let awsRegion: AWSRegion
    let service: String
    let target: String?
    let retryConfiguration: HTTPClientRetryConfiguration
    let retryOnErrorProvider: (SmokeHTTPClient.HTTPClientError) -> Bool
    let credentialsProvider: CredentialsProvider
    
    public let eventLoopGroup: EventLoopGroup
    let stage: String?

    let operationsReporting: EmptyExampleOperationsReporting
    
    public init(credentialsProvider: CredentialsProvider, awsRegion: AWSRegion,
                endpointHostName: String,
                stage: String? = nil,
                endpointPort: Int = 443,
                requiresTLS: Bool? = nil,
                service: String = "execute-api",
                contentType: String = "application/json",
                target: String? = nil,
                connectionTimeoutSeconds: Int64 = 10,
                retryConfiguration: HTTPClientRetryConfiguration = .default,
                eventLoopProvider: HTTPClient.EventLoopGroupProvider = .createNew,
                reportingConfiguration: SmokeAWSClientReportingConfiguration<EmptyExampleModelOperations>
                    = SmokeAWSClientReportingConfiguration<EmptyExampleModelOperations>() ) {
        self.eventLoopGroup = AWSClientHelper.getEventLoop(eventLoopGroupProvider: eventLoopProvider)
        let useTLS = requiresTLS ?? AWSHTTPClientDelegate.requiresTLS(forEndpointPort: endpointPort)
        let clientDelegate = JSONAWSHttpClientDelegate<EmptyExampleError>(requiresTLS: useTLS)

        self.httpClient = HTTPOperationsClient(
            endpointHostName: endpointHostName,
            endpointPort: endpointPort,
            contentType: contentType,
            clientDelegate: clientDelegate,
            connectionTimeoutSeconds: connectionTimeoutSeconds,
            eventLoopProvider: .shared(self.eventLoopGroup))
        self.awsRegion = awsRegion
        self.service = service
        self.target = target
        self.credentialsProvider = credentialsProvider
        self.retryConfiguration = retryConfiguration
        self.retryOnErrorProvider = { error in error.isRetriable() }
        self.stage = stage
        self.operationsReporting = EmptyExampleOperationsReporting(clientName: "APIGatewayEmptyExampleClient", reportingConfiguration: reportingConfiguration)
    }

    /**
     Gracefully shuts down this client. This function is idempotent and
     will handle being called multiple times. Will block until shutdown is complete.
     */
    public func syncShutdown() throws {
        try self.httpClient.syncShutdown()
    }

    // renamed `syncShutdown` to make it clearer this version of shutdown will block.
    @available(*, deprecated, renamed: "syncShutdown")
    public func close() throws {
        try self.httpClient.close()
    }

    /**
     Gracefully shuts down this client. This function is idempotent and
     will handle being called multiple times. Will return when shutdown is complete.
     */
    #if (os(Linux) && compiler(>=5.5)) || (!os(Linux) && compiler(>=5.5.2)) && canImport(_Concurrency)
    public func shutdown() async throws {
        try await self.httpClient.shutdown()
    }
    #endif
    
    public func with<NewInvocationReportingType: HTTPClientCoreInvocationReporting>(
            reporting: NewInvocationReportingType) -> APIGatewayEmptyExampleClient<NewInvocationReportingType> {
        return APIGatewayEmptyExampleClient<NewInvocationReportingType>(
            credentialsProvider: self.credentialsProvider,
            awsRegion: self.awsRegion,
            reporting: reporting,
            httpClient: self.httpClient,
            stage: self.stage,
            service: self.service,
            target: self.target,
            eventLoopGroup: self.eventLoopGroup,
            retryOnErrorProvider: self.retryOnErrorProvider,
            retryConfiguration: self.retryConfiguration,
            operationsReporting: self.operationsReporting)
    }
    
    public func with<NewTraceContextType: InvocationTraceContext>(
            logger: Logging.Logger,
            internalRequestId: String = "none",
            traceContext: NewTraceContextType,
            eventLoop: EventLoop? = nil) -> APIGatewayEmptyExampleClient<StandardHTTPClientCoreInvocationReporting<NewTraceContextType>> {
        let reporting = StandardHTTPClientCoreInvocationReporting(
            logger: logger,
            internalRequestId: internalRequestId,
            traceContext: traceContext,
            eventLoop: eventLoop)
        
        return with(reporting: reporting)
    }
    
    public func with(
            logger: Logging.Logger,
            internalRequestId: String = "none",
            eventLoop: EventLoop? = nil) -> APIGatewayEmptyExampleClient<StandardHTTPClientCoreInvocationReporting<SmokeInvocationTraceContext>> {
        let reporting = StandardHTTPClientCoreInvocationReporting(
            logger: logger,
            internalRequestId: internalRequestId,
            traceContext: SmokeInvocationTraceContext(),
            eventLoop: eventLoop)
        
        return with(reporting: reporting)
    }
}
