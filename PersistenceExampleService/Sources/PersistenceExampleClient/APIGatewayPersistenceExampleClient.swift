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
public struct APIGatewayPersistenceExampleClient<InvocationReportingType: HTTPClientCoreInvocationReporting>: PersistenceExampleClientProtocol {
    let httpClient: HTTPOperationsClient
    let ownsHttpClients: Bool
    let awsRegion: AWSRegion
    let service: String
    let target: String?
    let retryConfiguration: HTTPClientRetryConfiguration
    let retryOnErrorProvider: (SmokeHTTPClient.HTTPClientError) -> Bool
    let credentialsProvider: CredentialsProvider
    
    public let reporting: InvocationReportingType
    let stage: String

    let operationsReporting: PersistenceExampleOperationsReporting
    let invocationsReporting: PersistenceExampleInvocationsReporting<InvocationReportingType>
    
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
                reportingConfiguration: SmokeAWSClientReportingConfiguration<PersistenceExampleModelOperations>
                    = SmokeAWSClientReportingConfiguration<PersistenceExampleModelOperations>() ) {
        let useTLS = requiresTLS ?? AWSHTTPClientDelegate.requiresTLS(forEndpointPort: endpointPort)
        let clientDelegate = JSONAWSHttpClientDelegate<PersistenceExampleError>(requiresTLS: useTLS)

        self.httpClient = HTTPOperationsClient(
            endpointHostName: endpointHostName,
            endpointPort: endpointPort,
            contentType: contentType,
            clientDelegate: clientDelegate,
            connectionTimeoutSeconds: connectionTimeoutSeconds,
            eventLoopProvider: eventLoopProvider)
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
                stage: String,
                service: String,
                target: String?,
                retryOnErrorProvider: @escaping (SmokeHTTPClient.HTTPClientError) -> Bool,
                retryConfiguration: HTTPClientRetryConfiguration,
                operationsReporting: PersistenceExampleOperationsReporting) {
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
     Invokes the AddCustomerEmailAddress operation returning immediately and passing the response to a callback.

     - Parameters:
         - input: The validated AddCustomerEmailAddressRequest object being passed to this operation.
         - completion: The CustomerEmailAddressIdentity object or an error will be passed to this 
           callback when the operation is complete. The CustomerEmailAddressIdentity
           object will be validated before being returned to caller.
           The possible errors are: concurrency, customerEmailAddressAlreadyExists, customerEmailAddressLimitExceeded, unknownResource.
     */
    public func addCustomerEmailAddressAsync(
            input: PersistenceExampleModel.AddCustomerEmailAddressRequest, 
            completion: @escaping (Result<PersistenceExampleModel.CustomerEmailAddressIdentity, PersistenceExampleError>) -> ()) throws {
        let handlerDelegate = AWSClientInvocationDelegate(
                    credentialsProvider: credentialsProvider,
                    awsRegion: awsRegion,
                    service: service,
                    operation: PersistenceExampleModelOperations.addCustomerEmailAddress.rawValue,
                    target: target)
        
        let invocationContext = HTTPClientInvocationContext(reporting: self.invocationsReporting.addCustomerEmailAddress,
                                                            handlerDelegate: handlerDelegate)
        let requestInput = AddCustomerEmailAddressOperationHTTPRequestInput(encodable: input)

        _ = try httpClient.executeOperationAsyncRetriableWithOutput(
            endpointPath: "/\(stage)" + PersistenceExampleModelOperations.addCustomerEmailAddress.operationPath,
            httpMethod: .PUT,
            input: requestInput,
            completion: completion,
            invocationContext: invocationContext,
            retryConfiguration: retryConfiguration,
            retryOnError: retryOnErrorProvider)
    }

    /**
     Invokes the AddCustomerEmailAddress operation waiting for the response before returning.

     - Parameters:
         - input: The validated AddCustomerEmailAddressRequest object being passed to this operation.
     - Returns: The CustomerEmailAddressIdentity object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
     - Throws: concurrency, customerEmailAddressAlreadyExists, customerEmailAddressLimitExceeded, unknownResource.
     */
    public func addCustomerEmailAddressSync(
            input: PersistenceExampleModel.AddCustomerEmailAddressRequest) throws -> PersistenceExampleModel.CustomerEmailAddressIdentity {
        let handlerDelegate = AWSClientInvocationDelegate(
                    credentialsProvider: credentialsProvider,
                    awsRegion: awsRegion,
                    service: service,
                    operation: PersistenceExampleModelOperations.addCustomerEmailAddress.rawValue,
                    target: target)
        
        let invocationContext = HTTPClientInvocationContext(reporting: self.invocationsReporting.addCustomerEmailAddress,
                                                            handlerDelegate: handlerDelegate)
        let requestInput = AddCustomerEmailAddressOperationHTTPRequestInput(encodable: input)

        do {
            return try httpClient.executeSyncRetriableWithOutput(
                endpointPath: "/\(stage)" + PersistenceExampleModelOperations.addCustomerEmailAddress.operationPath,
                httpMethod: .PUT,
                input: requestInput,
                invocationContext: invocationContext,
                retryConfiguration: retryConfiguration,
                retryOnError: retryOnErrorProvider)
        } catch {
            let typedError: PersistenceExampleError = error.asTypedError()
            throw typedError
        }
    }

    /**
     Invokes the CreateCustomerPut operation returning immediately and passing the response to a callback.

     - Parameters:
         - input: The validated CreateCustomerRequest object being passed to this operation.
         - completion: The CreateCustomerPut200Response object or an error will be passed to this 
           callback when the operation is complete. The CreateCustomerPut200Response
           object will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    public func createCustomerPutAsync(
            input: PersistenceExampleModel.CreateCustomerRequest, 
            completion: @escaping (Result<PersistenceExampleModel.CreateCustomerPut200Response, PersistenceExampleError>) -> ()) throws {
        let handlerDelegate = AWSClientInvocationDelegate(
                    credentialsProvider: credentialsProvider,
                    awsRegion: awsRegion,
                    service: service,
                    operation: PersistenceExampleModelOperations.createCustomerPut.rawValue,
                    target: target)
        
        let invocationContext = HTTPClientInvocationContext(reporting: self.invocationsReporting.createCustomerPut,
                                                            handlerDelegate: handlerDelegate)
        let requestInput = CreateCustomerPutOperationHTTPRequestInput(encodable: input)

        _ = try httpClient.executeOperationAsyncRetriableWithOutput(
            endpointPath: "/\(stage)" + PersistenceExampleModelOperations.createCustomerPut.operationPath,
            httpMethod: .PUT,
            input: requestInput,
            completion: completion,
            invocationContext: invocationContext,
            retryConfiguration: retryConfiguration,
            retryOnError: retryOnErrorProvider)
    }

    /**
     Invokes the CreateCustomerPut operation waiting for the response before returning.

     - Parameters:
         - input: The validated CreateCustomerRequest object being passed to this operation.
     - Returns: The CreateCustomerPut200Response object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
     - Throws: unknownResource.
     */
    public func createCustomerPutSync(
            input: PersistenceExampleModel.CreateCustomerRequest) throws -> PersistenceExampleModel.CreateCustomerPut200Response {
        let handlerDelegate = AWSClientInvocationDelegate(
                    credentialsProvider: credentialsProvider,
                    awsRegion: awsRegion,
                    service: service,
                    operation: PersistenceExampleModelOperations.createCustomerPut.rawValue,
                    target: target)
        
        let invocationContext = HTTPClientInvocationContext(reporting: self.invocationsReporting.createCustomerPut,
                                                            handlerDelegate: handlerDelegate)
        let requestInput = CreateCustomerPutOperationHTTPRequestInput(encodable: input)

        do {
            return try httpClient.executeSyncRetriableWithOutput(
                endpointPath: "/\(stage)" + PersistenceExampleModelOperations.createCustomerPut.operationPath,
                httpMethod: .PUT,
                input: requestInput,
                invocationContext: invocationContext,
                retryConfiguration: retryConfiguration,
                retryOnError: retryOnErrorProvider)
        } catch {
            let typedError: PersistenceExampleError = error.asTypedError()
            throw typedError
        }
    }

    /**
     Invokes the GetCustomerDetails operation returning immediately and passing the response to a callback.

     - Parameters:
         - input: The validated GetCustomerDetailsRequest object being passed to this operation.
         - completion: The CustomerAttributes object or an error will be passed to this 
           callback when the operation is complete. The CustomerAttributes
           object will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    public func getCustomerDetailsAsync(
            input: PersistenceExampleModel.GetCustomerDetailsRequest, 
            completion: @escaping (Result<PersistenceExampleModel.CustomerAttributes, PersistenceExampleError>) -> ()) throws {
        let handlerDelegate = AWSClientInvocationDelegate(
                    credentialsProvider: credentialsProvider,
                    awsRegion: awsRegion,
                    service: service,
                    operation: PersistenceExampleModelOperations.getCustomerDetails.rawValue,
                    target: target)
        
        let invocationContext = HTTPClientInvocationContext(reporting: self.invocationsReporting.getCustomerDetails,
                                                            handlerDelegate: handlerDelegate)
        let requestInput = GetCustomerDetailsOperationHTTPRequestInput(encodable: input)

        _ = try httpClient.executeOperationAsyncRetriableWithOutput(
            endpointPath: "/\(stage)" + PersistenceExampleModelOperations.getCustomerDetails.operationPath,
            httpMethod: .GET,
            input: requestInput,
            completion: completion,
            invocationContext: invocationContext,
            retryConfiguration: retryConfiguration,
            retryOnError: retryOnErrorProvider)
    }

    /**
     Invokes the GetCustomerDetails operation waiting for the response before returning.

     - Parameters:
         - input: The validated GetCustomerDetailsRequest object being passed to this operation.
     - Returns: The CustomerAttributes object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
     - Throws: unknownResource.
     */
    public func getCustomerDetailsSync(
            input: PersistenceExampleModel.GetCustomerDetailsRequest) throws -> PersistenceExampleModel.CustomerAttributes {
        let handlerDelegate = AWSClientInvocationDelegate(
                    credentialsProvider: credentialsProvider,
                    awsRegion: awsRegion,
                    service: service,
                    operation: PersistenceExampleModelOperations.getCustomerDetails.rawValue,
                    target: target)
        
        let invocationContext = HTTPClientInvocationContext(reporting: self.invocationsReporting.getCustomerDetails,
                                                            handlerDelegate: handlerDelegate)
        let requestInput = GetCustomerDetailsOperationHTTPRequestInput(encodable: input)

        do {
            return try httpClient.executeSyncRetriableWithOutput(
                endpointPath: "/\(stage)" + PersistenceExampleModelOperations.getCustomerDetails.operationPath,
                httpMethod: .GET,
                input: requestInput,
                invocationContext: invocationContext,
                retryConfiguration: retryConfiguration,
                retryOnError: retryOnErrorProvider)
        } catch {
            let typedError: PersistenceExampleError = error.asTypedError()
            throw typedError
        }
    }

    /**
     Invokes the ListCustomersGet operation returning immediately and passing the response to a callback.

     - Parameters:
         - input: The validated ListCustomersGetRequest object being passed to this operation.
         - completion: The ListCustomersResponse object or an error will be passed to this 
           callback when the operation is complete. The ListCustomersResponse
           object will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    public func listCustomersGetAsync(
            input: PersistenceExampleModel.ListCustomersGetRequest, 
            completion: @escaping (Result<PersistenceExampleModel.ListCustomersResponse, PersistenceExampleError>) -> ()) throws {
        let handlerDelegate = AWSClientInvocationDelegate(
                    credentialsProvider: credentialsProvider,
                    awsRegion: awsRegion,
                    service: service,
                    operation: PersistenceExampleModelOperations.listCustomersGet.rawValue,
                    target: target)
        
        let invocationContext = HTTPClientInvocationContext(reporting: self.invocationsReporting.listCustomersGet,
                                                            handlerDelegate: handlerDelegate)
        let requestInput = ListCustomersGetOperationHTTPRequestInput(encodable: input)

        _ = try httpClient.executeOperationAsyncRetriableWithOutput(
            endpointPath: "/\(stage)" + PersistenceExampleModelOperations.listCustomersGet.operationPath,
            httpMethod: .GET,
            input: requestInput,
            completion: completion,
            invocationContext: invocationContext,
            retryConfiguration: retryConfiguration,
            retryOnError: retryOnErrorProvider)
    }

    /**
     Invokes the ListCustomersGet operation waiting for the response before returning.

     - Parameters:
         - input: The validated ListCustomersGetRequest object being passed to this operation.
     - Returns: The ListCustomersResponse object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
     - Throws: unknownResource.
     */
    public func listCustomersGetSync(
            input: PersistenceExampleModel.ListCustomersGetRequest) throws -> PersistenceExampleModel.ListCustomersResponse {
        let handlerDelegate = AWSClientInvocationDelegate(
                    credentialsProvider: credentialsProvider,
                    awsRegion: awsRegion,
                    service: service,
                    operation: PersistenceExampleModelOperations.listCustomersGet.rawValue,
                    target: target)
        
        let invocationContext = HTTPClientInvocationContext(reporting: self.invocationsReporting.listCustomersGet,
                                                            handlerDelegate: handlerDelegate)
        let requestInput = ListCustomersGetOperationHTTPRequestInput(encodable: input)

        do {
            return try httpClient.executeSyncRetriableWithOutput(
                endpointPath: "/\(stage)" + PersistenceExampleModelOperations.listCustomersGet.operationPath,
                httpMethod: .GET,
                input: requestInput,
                invocationContext: invocationContext,
                retryConfiguration: retryConfiguration,
                retryOnError: retryOnErrorProvider)
        } catch {
            let typedError: PersistenceExampleError = error.asTypedError()
            throw typedError
        }
    }
}
