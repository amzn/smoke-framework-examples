// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
// swiftlint:disable type_body_length function_body_length generic_type_name cyclomatic_complexity
// -- Generated Code; do not edit --
//
// APIGatewayPersistenceExampleClient.swift
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

public enum PersistenceExampleClientError: Swift.Error {
    case invalidEndpoint(String)
    case unsupportedPayload
    case unknownError(String?)
}

 extension PersistenceExampleError: ConvertableError {
    public static func asUnrecognizedError(error: Swift.Error) -> PersistenceExampleError {
        return error.asUnrecognizedPersistenceExampleError()
    }
}

/**
 API Gateway Client for the PersistenceExample service.
 */
public struct APIGatewayPersistenceExampleClient<InvocationReportingType: HTTPClientCoreInvocationReporting>: PersistenceExampleClientProtocol, AWSClientProtocol {
    let httpClient: HTTPOperationsClient
    let ownsHttpClients: Bool
    public let awsRegion: AWSRegion
    public let service: String
    public let target: String?
    public let retryConfiguration: HTTPClientRetryConfiguration
    public let retryOnErrorProvider: (SmokeHTTPClient.HTTPClientError) -> Bool
    public let credentialsProvider: CredentialsProvider
    
    public let eventLoopGroup: EventLoopGroup
    public let reporting: InvocationReportingType
    public let stage: String?

    let operationsReporting: PersistenceExampleOperationsReporting
    let invocationsReporting: PersistenceExampleInvocationsReporting<InvocationReportingType>
    
    public init(credentialsProvider: CredentialsProvider, awsRegion: AWSRegion,
                reporting: InvocationReportingType,
                endpointHostName: String,
                stage: String? = nil,
                endpointPort: Int = 443,
                requiresTLS: Bool? = nil,
                service: String = "execute-api",
                contentType: String = "application/json",
                target: String? = nil,
                connectionTimeoutSeconds: Int64 = 10,
                connectionPoolConfiguration: HTTPClient.Configuration.ConnectionPool? = nil,
                retryConfiguration: HTTPClientRetryConfiguration = .default,
                eventLoopProvider: HTTPClient.EventLoopGroupProvider = .createNew,
                reportingConfiguration: SmokeAWSClientReportingConfiguration<PersistenceExampleModelOperations>
                    = SmokeAWSClientReportingConfiguration<PersistenceExampleModelOperations>() ) {
        self.eventLoopGroup = AWSClientHelper.getEventLoop(eventLoopGroupProvider: eventLoopProvider)
        let useTLS = requiresTLS ?? AWSHTTPClientDelegate.requiresTLS(forEndpointPort: endpointPort)
        let clientDelegate = JSONAWSHttpClientDelegate<PersistenceExampleError>(requiresTLS: useTLS)

        self.httpClient = HTTPOperationsClient(
            endpointHostName: endpointHostName,
            endpointPort: endpointPort,
            contentType: contentType,
            clientDelegate: clientDelegate,
            connectionTimeoutSeconds: connectionTimeoutSeconds,
            eventLoopProvider: .shared(self.eventLoopGroup),
            connectionPoolConfiguration: connectionPoolConfiguration)
        self.ownsHttpClients = true
        self.awsRegion = awsRegion
        self.service = service
        self.target = target
        self.credentialsProvider = credentialsProvider
        self.retryConfiguration = retryConfiguration
        self.reporting = reporting
        self.retryOnErrorProvider = { error in error.isRetriable() }
        self.stage = stage
        self.operationsReporting = PersistenceExampleOperationsReporting(clientName: "APIGatewayPersistenceExampleClient", reportingConfiguration: reportingConfiguration)
        self.invocationsReporting = PersistenceExampleInvocationsReporting(reporting: reporting, operationsReporting: self.operationsReporting)
    }
    
    public init(credentialsProvider: CredentialsProvider, awsRegion: AWSRegion,
                logger: Logging.Logger,
                internalRequestId: String = "none",
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
        self.eventLoopGroup = AWSClientHelper.getEventLoop(eventLoopGroupProvider: eventLoopProvider)
        let useTLS = requiresTLS ?? AWSHTTPClientDelegate.requiresTLS(forEndpointPort: endpointPort)
        let clientDelegate = JSONAWSHttpClientDelegate<PersistenceExampleError>(requiresTLS: useTLS)

        let reporting = StandardHTTPClientCoreInvocationReporting(
            logger: logger,
            internalRequestId: internalRequestId,
            traceContext: SmokeInvocationTraceContext(),
            eventLoop: self.eventLoopGroup.next())
        self.httpClient = HTTPOperationsClient(
            endpointHostName: endpointHostName,
            endpointPort: endpointPort,
            contentType: contentType,
            clientDelegate: clientDelegate,
            timeoutConfiguration: timeoutConfiguration,
            eventLoopProvider: .shared(self.eventLoopGroup),
            connectionPoolConfiguration: connectionPoolConfiguration)
        self.ownsHttpClients = true
        self.awsRegion = awsRegion
        self.service = service
        self.target = target
        self.credentialsProvider = credentialsProvider
        self.retryConfiguration = retryConfiguration
        self.reporting = reporting
        self.retryOnErrorProvider = { error in error.isRetriable() }
        self.stage = stage
        self.operationsReporting = PersistenceExampleOperationsReporting(clientName: "APIGatewayPersistenceExampleClient", reportingConfiguration: reportingConfiguration)
        self.invocationsReporting = PersistenceExampleInvocationsReporting(reporting: reporting, operationsReporting: self.operationsReporting)
    }
    
    internal init(credentialsProvider: CredentialsProvider, awsRegion: AWSRegion,
                reporting: InvocationReportingType,
                httpClient: HTTPOperationsClient,
                stage: String?,
                service: String,
                target: String?,
                eventLoopGroup: EventLoopGroup,
                retryOnErrorProvider: @escaping (SmokeHTTPClient.HTTPClientError) -> Bool,
                retryConfiguration: HTTPClientRetryConfiguration,
                operationsReporting: PersistenceExampleOperationsReporting) {
        self.eventLoopGroup = eventLoopGroup
        self.httpClient = httpClient
        self.ownsHttpClients = false
        self.awsRegion = awsRegion
        self.service = service
        self.target = target
        self.credentialsProvider = credentialsProvider
        self.retryConfiguration = retryConfiguration
        self.reporting = reporting
        self.retryOnErrorProvider = retryOnErrorProvider
        self.stage = stage
        self.operationsReporting = operationsReporting
        self.invocationsReporting = PersistenceExampleInvocationsReporting(reporting: reporting, operationsReporting: self.operationsReporting)
    }
    
    public init(config: APIGatewayPersistenceExampleClientConfiguration<InvocationReportingType>,
                reporting: InvocationReportingType,
                eventLoop: EventLoop? = nil,
                httpClient: HTTPOperationsClient? = nil) {
        self.eventLoopGroup = eventLoop ?? config.eventLoopGroup

        self.httpClient = httpClient ?? config.createHTTPOperationsClient(eventLoopOverride: eventLoop)
        if httpClient != nil {
            self.ownsHttpClients = false
        } else {
            self.ownsHttpClients = true
        }
        self.awsRegion = config.awsRegion
        self.service = config.service
        self.target = config.target
        self.credentialsProvider = config.credentialsProvider
        self.retryConfiguration = config.retryConfiguration
        self.reporting = reporting
        self.retryOnErrorProvider = { error in error.isRetriable() }
        self.stage = config.stage
        self.operationsReporting = PersistenceExampleOperationsReporting(clientName: "APIGatewayPersistenceExampleClient", reportingConfiguration: config.reportingConfiguration)
        self.invocationsReporting = PersistenceExampleInvocationsReporting(reporting: reporting, operationsReporting: self.operationsReporting)
    }
    
    public init<TraceContextType: InvocationTraceContext>(
        config: APIGatewayPersistenceExampleClientConfiguration<StandardHTTPClientCoreInvocationReporting<TraceContextType>>,
        logger: Logging.Logger = Logger(label: "PersistenceExampleClient"),
        internalRequestId: String = "none",
        eventLoop: EventLoop? = nil,
        httpClient: HTTPOperationsClient? = nil)
    where InvocationReportingType == StandardHTTPClientCoreInvocationReporting<TraceContextType> {
        self.eventLoopGroup = eventLoop ?? config.eventLoopGroup

        self.httpClient = httpClient ?? config.createHTTPOperationsClient(eventLoopOverride: eventLoop)
        if httpClient != nil {
            self.ownsHttpClients = false
        } else {
            self.ownsHttpClients = true
        }
        self.awsRegion = config.awsRegion
        self.service = config.service
        self.target = config.target
        self.credentialsProvider = config.credentialsProvider
        self.retryConfiguration = config.retryConfiguration
        self.reporting = StandardHTTPClientCoreInvocationReporting(
            logger: logger,
            internalRequestId: internalRequestId,
            traceContext: config.traceContext,
            eventLoop: eventLoop)
        self.retryOnErrorProvider = { error in error.isRetriable() }
        self.stage = config.stage
        self.operationsReporting = PersistenceExampleOperationsReporting(clientName: "APIGatewayPersistenceExampleClient", reportingConfiguration: config.reportingConfiguration)
        self.invocationsReporting = PersistenceExampleInvocationsReporting(reporting: reporting, operationsReporting: self.operationsReporting)
    }
    
    public init<OperationsClientInvocationReportingType: HTTPClientCoreInvocationReporting>(
                operationsClient: APIGatewayPersistenceExampleOperationsClient<OperationsClientInvocationReportingType>,
                reporting: InvocationReportingType,
                eventLoop: EventLoop? = nil,
                httpClient: HTTPOperationsClient? = nil) {
        self.eventLoopGroup = eventLoop ?? operationsClient.config.eventLoopGroup

        self.httpClient = operationsClient.httpClient
        self.ownsHttpClients = false
        self.awsRegion = operationsClient.config.awsRegion
        self.service = operationsClient.config.service
        self.target = operationsClient.config.target
        self.credentialsProvider = operationsClient.config.credentialsProvider
        self.retryConfiguration = operationsClient.config.retryConfiguration
        self.reporting = reporting
        self.retryOnErrorProvider = { error in error.isRetriable() }
        self.stage = operationsClient.config.stage
        self.operationsReporting = PersistenceExampleOperationsReporting(clientName: "APIGatewayPersistenceExampleClient", reportingConfiguration: operationsClient.config.reportingConfiguration)
        self.invocationsReporting = PersistenceExampleInvocationsReporting(reporting: reporting, operationsReporting: self.operationsReporting)
    }
    
    public init<OperationsClientInvocationReportingType: HTTPClientCoreInvocationReporting>(
                operationsClient: APIGatewayPersistenceExampleOperationsClient<OperationsClientInvocationReportingType>,
                logger: Logging.Logger = Logger(label: "PersistenceExampleClient"),
                internalRequestId: String = "none",
                eventLoop: EventLoop? = nil)
    where InvocationReportingType == StandardHTTPClientCoreInvocationReporting<OperationsClientInvocationReportingType.TraceContextType> {
        self.eventLoopGroup = eventLoop ?? operationsClient.config.eventLoopGroup

        self.httpClient = operationsClient.httpClient
        self.ownsHttpClients = false
        self.awsRegion = operationsClient.config.awsRegion
        self.service = operationsClient.config.service
        self.target = operationsClient.config.target
        self.credentialsProvider = operationsClient.config.credentialsProvider
        self.retryConfiguration = operationsClient.config.retryConfiguration
        self.reporting = StandardHTTPClientCoreInvocationReporting(
            logger: logger,
            internalRequestId: internalRequestId,
            traceContext: operationsClient.config.traceContext,
            eventLoop: eventLoop)
        self.retryOnErrorProvider = { error in error.isRetriable() }
        self.stage = operationsClient.config.stage
        self.operationsReporting = PersistenceExampleOperationsReporting(clientName: "APIGatewayPersistenceExampleClient", reportingConfiguration: operationsClient.config.reportingConfiguration)
        self.invocationsReporting = PersistenceExampleInvocationsReporting(reporting: reporting, operationsReporting: self.operationsReporting)
    }

    /**
     Gracefully shuts down this client. This function is idempotent and
     will handle being called multiple times. Will block until shutdown is complete.
     */
    public func syncShutdown() throws {
        if self.ownsHttpClients {
            try self.httpClient.syncShutdown()
        }
    }

    /**
     Gracefully shuts down this client. This function is idempotent and
     will handle being called multiple times. Will return when shutdown is complete.
     */
    public func shutdown() async throws {
        if self.ownsHttpClients {
            try await self.httpClient.shutdown()
        }
    }

    /**
     Invokes the AddCustomerEmailAddress operation returning asynchronously at a later time once the operation is complete.

     - Parameters:
         - input: The validated AddCustomerEmailAddressRequest object being passed to this operation.
     - Returns: The CustomerEmailAddressIdentity object to be passed back from the caller of this async operation.
         Will be validated before being returned to caller.
           The possible errors are: concurrency, customerEmailAddressAlreadyExists, customerEmailAddressLimitExceeded, unknownResource.
     */
    public func addCustomerEmailAddress(
            input: PersistenceExampleModel.AddCustomerEmailAddressRequest) async throws -> PersistenceExampleModel.CustomerEmailAddressIdentity {
        let stagePrefix: String
        if let stage = stage { stagePrefix = "/\(stage)"; } else { stagePrefix = ""; }
        return try await executeWithOutput(
            httpClient: httpClient,
            endpointPath: stagePrefix + PersistenceExampleModelOperations.addCustomerEmailAddress.operationPath,
            httpMethod: .PUT,
            requestInput: AddCustomerEmailAddressOperationHTTPRequestInput(encodable: input),
            operation: PersistenceExampleModelOperations.addCustomerEmailAddress.rawValue,
            reporting: self.invocationsReporting.addCustomerEmailAddress,
            errorType: PersistenceExampleError.self)
    }

    /**
     Invokes the CreateCustomerPut operation returning asynchronously at a later time once the operation is complete.

     - Parameters:
         - input: The validated CreateCustomerRequest object being passed to this operation.
     - Returns: The CreateCustomerPut200Response object to be passed back from the caller of this async operation.
         Will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    public func createCustomerPut(
            input: PersistenceExampleModel.CreateCustomerRequest) async throws -> PersistenceExampleModel.CreateCustomerPut200Response {
        let stagePrefix: String
        if let stage = stage { stagePrefix = "/\(stage)"; } else { stagePrefix = ""; }
        return try await executeWithOutput(
            httpClient: httpClient,
            endpointPath: stagePrefix + PersistenceExampleModelOperations.createCustomerPut.operationPath,
            httpMethod: .PUT,
            requestInput: CreateCustomerPutOperationHTTPRequestInput(encodable: input),
            operation: PersistenceExampleModelOperations.createCustomerPut.rawValue,
            reporting: self.invocationsReporting.createCustomerPut,
            errorType: PersistenceExampleError.self)
    }

    /**
     Invokes the GetCustomerDetails operation returning asynchronously at a later time once the operation is complete.

     - Parameters:
         - input: The validated GetCustomerDetailsRequest object being passed to this operation.
     - Returns: The CustomerAttributes object to be passed back from the caller of this async operation.
         Will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    public func getCustomerDetails(
            input: PersistenceExampleModel.GetCustomerDetailsRequest) async throws -> PersistenceExampleModel.CustomerAttributes {
        let stagePrefix: String
        if let stage = stage { stagePrefix = "/\(stage)"; } else { stagePrefix = ""; }
        return try await executeWithOutput(
            httpClient: httpClient,
            endpointPath: stagePrefix + PersistenceExampleModelOperations.getCustomerDetails.operationPath,
            httpMethod: .GET,
            requestInput: GetCustomerDetailsOperationHTTPRequestInput(encodable: input),
            operation: PersistenceExampleModelOperations.getCustomerDetails.rawValue,
            reporting: self.invocationsReporting.getCustomerDetails,
            errorType: PersistenceExampleError.self)
    }

    /**
     Invokes the ListCustomersGet operation returning asynchronously at a later time once the operation is complete.

     - Parameters:
         - input: The validated ListCustomersGetRequest object being passed to this operation.
     - Returns: The ListCustomersResponse object to be passed back from the caller of this async operation.
         Will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    public func listCustomersGet(
            input: PersistenceExampleModel.ListCustomersGetRequest) async throws -> PersistenceExampleModel.ListCustomersResponse {
        let stagePrefix: String
        if let stage = stage { stagePrefix = "/\(stage)"; } else { stagePrefix = ""; }
        return try await executeWithOutput(
            httpClient: httpClient,
            endpointPath: stagePrefix + PersistenceExampleModelOperations.listCustomersGet.operationPath,
            httpMethod: .GET,
            requestInput: ListCustomersGetOperationHTTPRequestInput(encodable: input),
            operation: PersistenceExampleModelOperations.listCustomersGet.rawValue,
            reporting: self.invocationsReporting.listCustomersGet,
            errorType: PersistenceExampleError.self)
    }
}
