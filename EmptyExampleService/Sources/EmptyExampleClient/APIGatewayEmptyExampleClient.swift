// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
// swiftlint:disable type_body_length function_body_length generic_type_name cyclomatic_complexity
// -- Generated Code; do not edit --
//
// APIGatewayEmptyExampleClient.swift
// EmptyExampleClient
//

import Foundation
import EmptyExampleModel
import SmokeAWSCore
import SmokeHTTPClient
import NIO
import SmokeAWSHttp
import NIO
import NIOHTTP1
import AsyncHTTPClient
import Logging

public enum EmptyExampleClientError: Swift.Error {
    case invalidEndpoint(String)
    case unsupportedPayload
    case unknownError(String?)
}

 extension EmptyExampleError: ConvertableError {
    public static func asUnrecognizedError(error: Swift.Error) -> EmptyExampleError {
        return error.asUnrecognizedEmptyExampleError()
    }
}

/**
 API Gateway Client for the EmptyExample service.
 */
public struct APIGatewayEmptyExampleClient<InvocationReportingType: HTTPClientCoreInvocationReporting>: EmptyExampleClientProtocol, AWSClientProtocol {
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
    let stage: String

    let operationsReporting: EmptyExampleOperationsReporting
    let invocationsReporting: EmptyExampleInvocationsReporting<InvocationReportingType>
    
    public init(credentialsProvider: CredentialsProvider, awsRegion: AWSRegion,
                reporting: InvocationReportingType,
                endpointHostName: String,
                stage: String,
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
        self.ownsHttpClients = true
        self.awsRegion = awsRegion
        self.service = service
        self.target = target
        self.credentialsProvider = credentialsProvider
        self.retryConfiguration = retryConfiguration
        self.reporting = reporting
        self.retryOnErrorProvider = { error in error.isRetriable() }
        self.stage = stage
        self.operationsReporting = EmptyExampleOperationsReporting(clientName: "APIGatewayEmptyExampleClient", reportingConfiguration: reportingConfiguration)
        self.invocationsReporting = EmptyExampleInvocationsReporting(reporting: reporting, operationsReporting: self.operationsReporting)
    }
    
    internal init(credentialsProvider: CredentialsProvider, awsRegion: AWSRegion,
                reporting: InvocationReportingType,
                httpClient: HTTPOperationsClient,
                stage: String,
                service: String,
                target: String?,
                eventLoopGroup: EventLoopGroup,
                retryOnErrorProvider: @escaping (SmokeHTTPClient.HTTPClientError) -> Bool,
                retryConfiguration: HTTPClientRetryConfiguration,
                operationsReporting: EmptyExampleOperationsReporting) {
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
        self.invocationsReporting = EmptyExampleInvocationsReporting(reporting: reporting, operationsReporting: self.operationsReporting)
    }

    /**
     Gracefully shuts down this client. This function is idempotent and
     will handle being called multiple times.
     */
    public func close() throws {
        if self.ownsHttpClients {
            try httpClient.close()
        }
    }

    /**
     Invokes the AddCustomerEmailAddress operation returning immediately with an `EventLoopFuture` that will be completed with the result at a later time.

     - Parameters:
         - input: The validated AddCustomerEmailAddressRequest object being passed to this operation.
     - Returns: A future to the CustomerEmailAddressIdentity object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
           The possible errors are: concurrency, customerEmailAddressAlreadyExists, customerEmailAddressLimitExceeded, unknownResource.
     */
    public func addCustomerEmailAddress(
            input: EmptyExampleModel.AddCustomerEmailAddressRequest) -> EventLoopFuture<EmptyExampleModel.CustomerEmailAddressIdentity> {
        return executeWithOutput(httpClient: httpClient,
                                 endpointPath: "/\(stage)" + EmptyExampleModelOperations.addCustomerEmailAddress.operationPath,
                                 httpMethod: .PUT,
                                 requestInput: AddCustomerEmailAddressOperationHTTPRequestInput(encodable: input),
                                 operation: EmptyExampleModelOperations.addCustomerEmailAddress.rawValue,
                                 reporting: self.invocationsReporting.addCustomerEmailAddress,
                                 errorType: EmptyExampleError.self)
    }

    /**
     Invokes the CreateCustomerPut operation returning immediately with an `EventLoopFuture` that will be completed with the result at a later time.

     - Parameters:
         - input: The validated CreateCustomerRequest object being passed to this operation.
     - Returns: A future to the CreateCustomerPut200Response object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    public func createCustomerPut(
            input: EmptyExampleModel.CreateCustomerRequest) -> EventLoopFuture<EmptyExampleModel.CreateCustomerPut200Response> {
        return executeWithOutput(httpClient: httpClient,
                                 endpointPath: "/\(stage)" + EmptyExampleModelOperations.createCustomerPut.operationPath,
                                 httpMethod: .PUT,
                                 requestInput: CreateCustomerPutOperationHTTPRequestInput(encodable: input),
                                 operation: EmptyExampleModelOperations.createCustomerPut.rawValue,
                                 reporting: self.invocationsReporting.createCustomerPut,
                                 errorType: EmptyExampleError.self)
    }

    /**
     Invokes the GetCustomerDetails operation returning immediately with an `EventLoopFuture` that will be completed with the result at a later time.

     - Parameters:
         - input: The validated GetCustomerDetailsRequest object being passed to this operation.
     - Returns: A future to the CustomerAttributes object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    public func getCustomerDetails(
            input: EmptyExampleModel.GetCustomerDetailsRequest) -> EventLoopFuture<EmptyExampleModel.CustomerAttributes> {
        return executeWithOutput(httpClient: httpClient,
                                 endpointPath: "/\(stage)" + EmptyExampleModelOperations.getCustomerDetails.operationPath,
                                 httpMethod: .GET,
                                 requestInput: GetCustomerDetailsOperationHTTPRequestInput(encodable: input),
                                 operation: EmptyExampleModelOperations.getCustomerDetails.rawValue,
                                 reporting: self.invocationsReporting.getCustomerDetails,
                                 errorType: EmptyExampleError.self)
    }

    /**
     Invokes the ListCustomersGet operation returning immediately with an `EventLoopFuture` that will be completed with the result at a later time.

     - Parameters:
         - input: The validated ListCustomersGetRequest object being passed to this operation.
     - Returns: A future to the ListCustomersResponse object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    public func listCustomersGet(
            input: EmptyExampleModel.ListCustomersGetRequest) -> EventLoopFuture<EmptyExampleModel.ListCustomersResponse> {
        return executeWithOutput(httpClient: httpClient,
                                 endpointPath: "/\(stage)" + EmptyExampleModelOperations.listCustomersGet.operationPath,
                                 httpMethod: .GET,
                                 requestInput: ListCustomersGetOperationHTTPRequestInput(encodable: input),
                                 operation: EmptyExampleModelOperations.listCustomersGet.rawValue,
                                 reporting: self.invocationsReporting.listCustomersGet,
                                 errorType: EmptyExampleError.self)
    }
}
