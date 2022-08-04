// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
// swiftlint:disable type_body_length function_body_length generic_type_name cyclomatic_complexity
// -- Generated Code; do not edit --
//
// APIGatewayPersistenceExampleClientConfiguration.swift
// PersistenceExampleClient
//

import Foundation
import PersistenceExampleModel
import SmokeAWSCore
import SmokeHTTPClient
import SmokeAWSHttp
import NIO
import NIOHTTP1
import AsyncHTTPClient
import Logging
import SmokeOperationsHTTP1

/**
 Configuration Object for the PersistenceExample client.
 */
public struct APIGatewayPersistenceExampleClientConfiguration<InvocationReportingType: HTTPClientCoreInvocationReporting> {
    public let endpointHostName: String
    public let endpointPort: Int
    public let contentType: String
    public let timeoutConfiguration: HTTPClient.Configuration.Timeout
    public let connectionPoolConfiguration: HTTPClient.Configuration.ConnectionPool?
    public let awsRegion: AWSRegion
    public let service: String
    public let target: String?
    public let retryConfiguration: HTTPClientRetryConfiguration
    public let traceContext: InvocationReportingType.TraceContextType
    public let reportingConfiguration: SmokeAWSClientReportingConfiguration<PersistenceExampleModelOperations>
    
    public let eventLoopGroup: EventLoopGroup
    public let stage: String?

    internal let clientDelegate: JSONAWSHttpClientDelegate<PersistenceExampleError>

    internal let reportingProvider: (Logger, String, EventLoop?) -> InvocationReportingType
    internal let credentialsProvider: CredentialsProvider
    
    public init<TraceContextType: InvocationTraceContext>(credentialsProvider: CredentialsProvider, awsRegion: AWSRegion,
                endpointHostName: String,
                stage: String? = nil,
                endpointPort: Int = 443,
                requiresTLS: Bool? = nil,
                service: String = "execute-api",
                contentType: String = "application/json",
                target: String? = nil,
                traceContext: TraceContextType,
                timeoutConfiguration: HTTPClient.Configuration.Timeout = .init(),
                connectionPoolConfiguration: HTTPClient.Configuration.ConnectionPool? = nil,
                retryConfiguration: HTTPClientRetryConfiguration = .default,
                eventLoopProvider: HTTPClient.EventLoopGroupProvider = .createNew,
                reportingConfiguration: SmokeAWSClientReportingConfiguration<PersistenceExampleModelOperations>
                    = SmokeAWSClientReportingConfiguration<PersistenceExampleModelOperations>() )
    where InvocationReportingType == StandardHTTPClientCoreInvocationReporting<TraceContextType> {
        self.eventLoopGroup = AWSClientHelper.getEventLoop(eventLoopGroupProvider: eventLoopProvider)
        let useTLS = requiresTLS ?? AWSHTTPClientDelegate.requiresTLS(forEndpointPort: endpointPort)
        self.clientDelegate = JSONAWSHttpClientDelegate<PersistenceExampleError>(requiresTLS: useTLS)

        self.endpointHostName = endpointHostName
        self.endpointPort = endpointPort
        self.contentType = contentType
        self.traceContext = traceContext
        self.timeoutConfiguration = timeoutConfiguration
        self.connectionPoolConfiguration = connectionPoolConfiguration
        self.awsRegion = awsRegion
        self.service = service
        self.target = target
        self.credentialsProvider = credentialsProvider
        self.retryConfiguration = retryConfiguration
        self.stage = stage
        self.reportingConfiguration = reportingConfiguration
                        
        self.reportingProvider = { (logger, internalRequestId, eventLoop) in
            return StandardHTTPClientCoreInvocationReporting(
                logger: logger,
                internalRequestId: internalRequestId,
                traceContext: traceContext,
                eventLoop: eventLoop)
        }
    }
    
    public init(credentialsProvider: CredentialsProvider, awsRegion: AWSRegion,
                endpointHostName: String,
                stage: String? = nil,
                endpointPort: Int = 443,
                requiresTLS: Bool? = nil,
                service: String = "execute-api",
                contentType: String = "application/json",
                target: String? = nil,
                timeoutConfiguration: HTTPClient.Configuration.Timeout = .init(),
                connectionPoolConfiguration: HTTPClient.Configuration.ConnectionPool? = nil,
                retryConfiguration: HTTPClientRetryConfiguration = .default,
                eventLoopProvider: HTTPClient.EventLoopGroupProvider = .createNew,
                reportingConfiguration: SmokeAWSClientReportingConfiguration<PersistenceExampleModelOperations>
                    = SmokeAWSClientReportingConfiguration<PersistenceExampleModelOperations>() )
    where InvocationReportingType == StandardHTTPClientCoreInvocationReporting<SmokeInvocationTraceContext> {
        self.init(credentialsProvider: credentialsProvider,
                  awsRegion: awsRegion,
                  endpointHostName: endpointHostName,
                  endpointPort: endpointPort,
                  requiresTLS: requiresTLS,
                  service: service,
                  contentType: contentType,
                  target: target,
                  traceContext: SmokeInvocationTraceContext(),
                  timeoutConfiguration: timeoutConfiguration,
                  connectionPoolConfiguration: connectionPoolConfiguration,
                  retryConfiguration: retryConfiguration,
                  eventLoopProvider: eventLoopProvider,
                  reportingConfiguration: reportingConfiguration)
    }
    
    internal func createHTTPOperationsClient(eventLoopOverride: EventLoop? = nil) -> HTTPOperationsClient {
        return HTTPOperationsClient(
            endpointHostName: self.endpointHostName,
            endpointPort: self.endpointPort,
            contentType: self.contentType,
            clientDelegate: self.clientDelegate,
            timeoutConfiguration: self.timeoutConfiguration,
            eventLoopProvider: .shared(eventLoopOverride ?? self.eventLoopGroup),
            connectionPoolConfiguration: self.connectionPoolConfiguration)
    }
}


/**
 Shared Operations Client for the PersistenceExample client.
 */
public struct APIGatewayPersistenceExampleOperationsClient<InvocationReportingType: HTTPClientCoreInvocationReporting> {
    public let config: APIGatewayPersistenceExampleClientConfiguration<InvocationReportingType>
    public let httpClient: HTTPOperationsClient
    
    public init<TraceContextType: InvocationTraceContext>(credentialsProvider: CredentialsProvider, awsRegion: AWSRegion,
                endpointHostName: String,
                stage: String? = nil,
                endpointPort: Int = 443,
                requiresTLS: Bool? = nil,
                service: String = "execute-api",
                contentType: String = "application/json",
                target: String? = nil,
                traceContext: TraceContextType,
                timeoutConfiguration: HTTPClient.Configuration.Timeout = .init(),
                connectionPoolConfiguration: HTTPClient.Configuration.ConnectionPool? = nil,
                retryConfiguration: HTTPClientRetryConfiguration = .default,
                eventLoopProvider: HTTPClient.EventLoopGroupProvider = .createNew,
                reportingConfiguration: SmokeAWSClientReportingConfiguration<PersistenceExampleModelOperations>
                    = SmokeAWSClientReportingConfiguration<PersistenceExampleModelOperations>() )
    where InvocationReportingType == StandardHTTPClientCoreInvocationReporting<TraceContextType> {
        self.config = APIGatewayPersistenceExampleClientConfiguration(
            credentialsProvider: credentialsProvider,
            awsRegion: awsRegion,
            endpointHostName: endpointHostName,
            endpointPort: endpointPort,
            requiresTLS: requiresTLS,
            service: service,
            contentType: contentType,
            target: target,
            traceContext: traceContext,
            timeoutConfiguration: timeoutConfiguration,
            connectionPoolConfiguration: connectionPoolConfiguration,
            retryConfiguration: retryConfiguration,
            eventLoopProvider: eventLoopProvider,
            reportingConfiguration: reportingConfiguration)
        self.httpClient = self.config.createHTTPOperationsClient()
    }
    
    public init(credentialsProvider: CredentialsProvider, awsRegion: AWSRegion,
                endpointHostName: String,
                stage: String? = nil,
                endpointPort: Int = 443,
                requiresTLS: Bool? = nil,
                service: String = "execute-api",
                contentType: String = "application/json",
                target: String? = nil,
                timeoutConfiguration: HTTPClient.Configuration.Timeout = .init(),
                connectionPoolConfiguration: HTTPClient.Configuration.ConnectionPool? = nil,
                retryConfiguration: HTTPClientRetryConfiguration = .default,
                eventLoopProvider: HTTPClient.EventLoopGroupProvider = .createNew,
                reportingConfiguration: SmokeAWSClientReportingConfiguration<PersistenceExampleModelOperations>
                    = SmokeAWSClientReportingConfiguration<PersistenceExampleModelOperations>() )
    where InvocationReportingType == StandardHTTPClientCoreInvocationReporting<SmokeInvocationTraceContext> {
        self.config = APIGatewayPersistenceExampleClientConfiguration(
            credentialsProvider: credentialsProvider,
            awsRegion: awsRegion,
            endpointHostName: endpointHostName,
            endpointPort: endpointPort,
            requiresTLS: requiresTLS,
            service: service,
            contentType: contentType,
            target: target,
            traceContext: SmokeInvocationTraceContext(),
            timeoutConfiguration: timeoutConfiguration,
            connectionPoolConfiguration: connectionPoolConfiguration,
            retryConfiguration: retryConfiguration,
            eventLoopProvider: eventLoopProvider,
            reportingConfiguration: reportingConfiguration)
        self.httpClient = self.config.createHTTPOperationsClient()
    }
    
    public init(config: APIGatewayPersistenceExampleClientConfiguration<InvocationReportingType>,
                httpClient: HTTPOperationsClient? = nil) {
        self.config = config
        self.httpClient = httpClient ?? self.config.createHTTPOperationsClient()
    }

    /**
     Gracefully shuts down this client. This function is idempotent and
     will handle being called multiple times. Will block until shutdown is complete.
     */
    public func syncShutdown() throws {
        try self.httpClient.syncShutdown()
    }

    /**
     Gracefully shuts down this client. This function is idempotent and
     will handle being called multiple times. Will return when shutdown is complete.
     */
    public func shutdown() async throws {
        try await self.httpClient.shutdown()
    }
}
