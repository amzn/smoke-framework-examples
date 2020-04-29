// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment type_body_length
// -- Generated Code; do not edit --
//
// APIGatewayEmptyExampleClient.swift
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

public enum EmptyExampleClientError: Swift.Error {
    case invalidEndpoint(String)
    case unsupportedPayload
    case unknownError(String?)
}

 extension EmptyExampleError: ConvertableError {
    public static func asUnrecognizedError(error: Swift.Error) -> EmptyExampleError {
        return error.asUnrecognizedEmptyExampleError()
    }

    func isRetriable() -> Bool {
        return false
    }
}

private extension Swift.Error {
    func isRetriable() -> Bool {
        if let typedError = self as? EmptyExampleError {
            return typedError.isRetriable()
        } else {
            return true
        }
    }
}

/**
 API Gateway Client for the EmptyExample service.
 */
public struct APIGatewayEmptyExampleClient<InvocationReportingType: HTTPClientCoreInvocationReporting>: EmptyExampleClientProtocol {
    let httpClient: HTTPOperationsClient
    let awsRegion: AWSRegion
    let service: String
    let target: String?
    let retryConfiguration: HTTPClientRetryConfiguration
    let retryOnErrorProvider: (Swift.Error) -> Bool
    let credentialsProvider: CredentialsProvider
    
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
        let useTLS = requiresTLS ?? AWSHTTPClientDelegate.requiresTLS(forEndpointPort: endpointPort)
        let clientDelegate = JSONAWSHttpClientDelegate<EmptyExampleError>(requiresTLS: useTLS)

        self.httpClient = HTTPOperationsClient(endpointHostName: endpointHostName,
                                               endpointPort: endpointPort,
                                               contentType: contentType,
                                               clientDelegate: clientDelegate,
                                               connectionTimeoutSeconds: connectionTimeoutSeconds,
                                               eventLoopProvider: eventLoopProvider)
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
                retryOnErrorProvider: @escaping (Swift.Error) -> Bool,
                retryConfiguration: HTTPClientRetryConfiguration,
                operationsReporting: EmptyExampleOperationsReporting) {
        self.httpClient = httpClient
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
        try httpClient.close()
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
            input: EmptyExampleModel.AddCustomerEmailAddressRequest, 
            completion: @escaping (Result<EmptyExampleModel.CustomerEmailAddressIdentity, EmptyExampleError>) -> ()) throws {
        let handlerDelegate = AWSClientInvocationDelegate(
                    credentialsProvider: credentialsProvider,
                    awsRegion: awsRegion,
                    service: service,
                    operation: EmptyExampleModelOperations.addCustomerEmailAddress.rawValue,
                    target: target)
        
        let invocationContext = HTTPClientInvocationContext(reporting: self.invocationsReporting.addCustomerEmailAddress,
                                                            handlerDelegate: handlerDelegate)
        let requestInput = AddCustomerEmailAddressOperationHTTPRequestInput(encodable: input)

        _ = try httpClient.executeOperationAsyncRetriableWithOutput(
            endpointPath: "/\(stage)" + EmptyExampleModelOperations.addCustomerEmailAddress.operationPath,
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
            input: EmptyExampleModel.AddCustomerEmailAddressRequest) throws -> EmptyExampleModel.CustomerEmailAddressIdentity {
        let handlerDelegate = AWSClientInvocationDelegate(
                    credentialsProvider: credentialsProvider,
                    awsRegion: awsRegion,
                    service: service,
                    operation: EmptyExampleModelOperations.addCustomerEmailAddress.rawValue,
                    target: target)
        
        let invocationContext = HTTPClientInvocationContext(reporting: self.invocationsReporting.addCustomerEmailAddress,
                                                            handlerDelegate: handlerDelegate)
        let requestInput = AddCustomerEmailAddressOperationHTTPRequestInput(encodable: input)

        do {
            return try httpClient.executeSyncRetriableWithOutput(
                endpointPath: "/\(stage)" + EmptyExampleModelOperations.addCustomerEmailAddress.operationPath,
                httpMethod: .PUT,
                input: requestInput,
                invocationContext: invocationContext,
                retryConfiguration: retryConfiguration,
                retryOnError: retryOnErrorProvider)
        } catch {
            let typedError: EmptyExampleError = error.asTypedError()
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
            input: EmptyExampleModel.CreateCustomerRequest, 
            completion: @escaping (Result<EmptyExampleModel.CreateCustomerPut200Response, EmptyExampleError>) -> ()) throws {
        let handlerDelegate = AWSClientInvocationDelegate(
                    credentialsProvider: credentialsProvider,
                    awsRegion: awsRegion,
                    service: service,
                    operation: EmptyExampleModelOperations.createCustomerPut.rawValue,
                    target: target)
        
        let invocationContext = HTTPClientInvocationContext(reporting: self.invocationsReporting.createCustomerPut,
                                                            handlerDelegate: handlerDelegate)
        let requestInput = CreateCustomerPutOperationHTTPRequestInput(encodable: input)

        _ = try httpClient.executeOperationAsyncRetriableWithOutput(
            endpointPath: "/\(stage)" + EmptyExampleModelOperations.createCustomerPut.operationPath,
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
            input: EmptyExampleModel.CreateCustomerRequest) throws -> EmptyExampleModel.CreateCustomerPut200Response {
        let handlerDelegate = AWSClientInvocationDelegate(
                    credentialsProvider: credentialsProvider,
                    awsRegion: awsRegion,
                    service: service,
                    operation: EmptyExampleModelOperations.createCustomerPut.rawValue,
                    target: target)
        
        let invocationContext = HTTPClientInvocationContext(reporting: self.invocationsReporting.createCustomerPut,
                                                            handlerDelegate: handlerDelegate)
        let requestInput = CreateCustomerPutOperationHTTPRequestInput(encodable: input)

        do {
            return try httpClient.executeSyncRetriableWithOutput(
                endpointPath: "/\(stage)" + EmptyExampleModelOperations.createCustomerPut.operationPath,
                httpMethod: .PUT,
                input: requestInput,
                invocationContext: invocationContext,
                retryConfiguration: retryConfiguration,
                retryOnError: retryOnErrorProvider)
        } catch {
            let typedError: EmptyExampleError = error.asTypedError()
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
            input: EmptyExampleModel.GetCustomerDetailsRequest, 
            completion: @escaping (Result<EmptyExampleModel.CustomerAttributes, EmptyExampleError>) -> ()) throws {
        let handlerDelegate = AWSClientInvocationDelegate(
                    credentialsProvider: credentialsProvider,
                    awsRegion: awsRegion,
                    service: service,
                    operation: EmptyExampleModelOperations.getCustomerDetails.rawValue,
                    target: target)
        
        let invocationContext = HTTPClientInvocationContext(reporting: self.invocationsReporting.getCustomerDetails,
                                                            handlerDelegate: handlerDelegate)
        let requestInput = GetCustomerDetailsOperationHTTPRequestInput(encodable: input)

        _ = try httpClient.executeOperationAsyncRetriableWithOutput(
            endpointPath: "/\(stage)" + EmptyExampleModelOperations.getCustomerDetails.operationPath,
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
            input: EmptyExampleModel.GetCustomerDetailsRequest) throws -> EmptyExampleModel.CustomerAttributes {
        let handlerDelegate = AWSClientInvocationDelegate(
                    credentialsProvider: credentialsProvider,
                    awsRegion: awsRegion,
                    service: service,
                    operation: EmptyExampleModelOperations.getCustomerDetails.rawValue,
                    target: target)
        
        let invocationContext = HTTPClientInvocationContext(reporting: self.invocationsReporting.getCustomerDetails,
                                                            handlerDelegate: handlerDelegate)
        let requestInput = GetCustomerDetailsOperationHTTPRequestInput(encodable: input)

        do {
            return try httpClient.executeSyncRetriableWithOutput(
                endpointPath: "/\(stage)" + EmptyExampleModelOperations.getCustomerDetails.operationPath,
                httpMethod: .GET,
                input: requestInput,
                invocationContext: invocationContext,
                retryConfiguration: retryConfiguration,
                retryOnError: retryOnErrorProvider)
        } catch {
            let typedError: EmptyExampleError = error.asTypedError()
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
            input: EmptyExampleModel.ListCustomersGetRequest, 
            completion: @escaping (Result<EmptyExampleModel.ListCustomersResponse, EmptyExampleError>) -> ()) throws {
        let handlerDelegate = AWSClientInvocationDelegate(
                    credentialsProvider: credentialsProvider,
                    awsRegion: awsRegion,
                    service: service,
                    operation: EmptyExampleModelOperations.listCustomersGet.rawValue,
                    target: target)
        
        let invocationContext = HTTPClientInvocationContext(reporting: self.invocationsReporting.listCustomersGet,
                                                            handlerDelegate: handlerDelegate)
        let requestInput = ListCustomersGetOperationHTTPRequestInput(encodable: input)

        _ = try httpClient.executeOperationAsyncRetriableWithOutput(
            endpointPath: "/\(stage)" + EmptyExampleModelOperations.listCustomersGet.operationPath,
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
            input: EmptyExampleModel.ListCustomersGetRequest) throws -> EmptyExampleModel.ListCustomersResponse {
        let handlerDelegate = AWSClientInvocationDelegate(
                    credentialsProvider: credentialsProvider,
                    awsRegion: awsRegion,
                    service: service,
                    operation: EmptyExampleModelOperations.listCustomersGet.rawValue,
                    target: target)
        
        let invocationContext = HTTPClientInvocationContext(reporting: self.invocationsReporting.listCustomersGet,
                                                            handlerDelegate: handlerDelegate)
        let requestInput = ListCustomersGetOperationHTTPRequestInput(encodable: input)

        do {
            return try httpClient.executeSyncRetriableWithOutput(
                endpointPath: "/\(stage)" + EmptyExampleModelOperations.listCustomersGet.operationPath,
                httpMethod: .GET,
                input: requestInput,
                invocationContext: invocationContext,
                retryConfiguration: retryConfiguration,
                retryOnError: retryOnErrorProvider)
        } catch {
            let typedError: EmptyExampleError = error.asTypedError()
            throw typedError
        }
    }
}
