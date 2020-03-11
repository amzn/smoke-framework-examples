// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment type_body_length
// -- Generated Code; do not edit --
//
// EmptyExampleClientProtocol.swift
// EmptyExampleClient
//

import Foundation
import EmptyExampleModel
import SmokeAWSCore
import SmokeHTTPClient

/**
 Client Protocol for the EmptyExample service.
 */
public protocol EmptyExampleClientProtocol {
    typealias AddCustomerEmailAddressSyncType = (
            _ input: EmptyExampleModel.AddCustomerEmailAddressRequest) throws -> EmptyExampleModel.CustomerEmailAddressIdentity
    typealias AddCustomerEmailAddressAsyncType = (
            _ input: EmptyExampleModel.AddCustomerEmailAddressRequest, 
            _ completion: @escaping (Result<EmptyExampleModel.CustomerEmailAddressIdentity, EmptyExampleError>) -> ()) throws -> ()
    typealias CreateCustomerPutSyncType = (
            _ input: EmptyExampleModel.CreateCustomerRequest) throws -> EmptyExampleModel.CreateCustomerPut200Response
    typealias CreateCustomerPutAsyncType = (
            _ input: EmptyExampleModel.CreateCustomerRequest, 
            _ completion: @escaping (Result<EmptyExampleModel.CreateCustomerPut200Response, EmptyExampleError>) -> ()) throws -> ()
    typealias GetCustomerDetailsSyncType = (
            _ input: EmptyExampleModel.GetCustomerDetailsRequest) throws -> EmptyExampleModel.CustomerAttributes
    typealias GetCustomerDetailsAsyncType = (
            _ input: EmptyExampleModel.GetCustomerDetailsRequest, 
            _ completion: @escaping (Result<EmptyExampleModel.CustomerAttributes, EmptyExampleError>) -> ()) throws -> ()
    typealias ListCustomersGetSyncType = (
            _ input: EmptyExampleModel.ListCustomersGetRequest) throws -> EmptyExampleModel.ListCustomersResponse
    typealias ListCustomersGetAsyncType = (
            _ input: EmptyExampleModel.ListCustomersGetRequest, 
            _ completion: @escaping (Result<EmptyExampleModel.ListCustomersResponse, EmptyExampleError>) -> ()) throws -> ()

    /**
     Invokes the AddCustomerEmailAddress operation returning immediately and passing the response to a callback.

     - Parameters:
         - input: The validated AddCustomerEmailAddressRequest object being passed to this operation.
         - completion: The CustomerEmailAddressIdentity object or an error will be passed to this 
           callback when the operation is complete. The CustomerEmailAddressIdentity
           object will be validated before being returned to caller.
           The possible errors are: concurrency, customerEmailAddressAlreadyExists, customerEmailAddressLimitExceeded, unknownResource.
     */
    func addCustomerEmailAddressAsync(
            input: EmptyExampleModel.AddCustomerEmailAddressRequest, 
            completion: @escaping (Result<EmptyExampleModel.CustomerEmailAddressIdentity, EmptyExampleError>) -> ()) throws

    /**
     Invokes the AddCustomerEmailAddress operation waiting for the response before returning.

     - Parameters:
         - input: The validated AddCustomerEmailAddressRequest object being passed to this operation.
     - Returns: The CustomerEmailAddressIdentity object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
     - Throws: concurrency, customerEmailAddressAlreadyExists, customerEmailAddressLimitExceeded, unknownResource.
     */
    func addCustomerEmailAddressSync(
            input: EmptyExampleModel.AddCustomerEmailAddressRequest) throws -> EmptyExampleModel.CustomerEmailAddressIdentity

    /**
     Invokes the CreateCustomerPut operation returning immediately and passing the response to a callback.

     - Parameters:
         - input: The validated CreateCustomerRequest object being passed to this operation.
         - completion: The CreateCustomerPut200Response object or an error will be passed to this 
           callback when the operation is complete. The CreateCustomerPut200Response
           object will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    func createCustomerPutAsync(
            input: EmptyExampleModel.CreateCustomerRequest, 
            completion: @escaping (Result<EmptyExampleModel.CreateCustomerPut200Response, EmptyExampleError>) -> ()) throws

    /**
     Invokes the CreateCustomerPut operation waiting for the response before returning.

     - Parameters:
         - input: The validated CreateCustomerRequest object being passed to this operation.
     - Returns: The CreateCustomerPut200Response object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
     - Throws: unknownResource.
     */
    func createCustomerPutSync(
            input: EmptyExampleModel.CreateCustomerRequest) throws -> EmptyExampleModel.CreateCustomerPut200Response

    /**
     Invokes the GetCustomerDetails operation returning immediately and passing the response to a callback.

     - Parameters:
         - input: The validated GetCustomerDetailsRequest object being passed to this operation.
         - completion: The CustomerAttributes object or an error will be passed to this 
           callback when the operation is complete. The CustomerAttributes
           object will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    func getCustomerDetailsAsync(
            input: EmptyExampleModel.GetCustomerDetailsRequest, 
            completion: @escaping (Result<EmptyExampleModel.CustomerAttributes, EmptyExampleError>) -> ()) throws

    /**
     Invokes the GetCustomerDetails operation waiting for the response before returning.

     - Parameters:
         - input: The validated GetCustomerDetailsRequest object being passed to this operation.
     - Returns: The CustomerAttributes object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
     - Throws: unknownResource.
     */
    func getCustomerDetailsSync(
            input: EmptyExampleModel.GetCustomerDetailsRequest) throws -> EmptyExampleModel.CustomerAttributes

    /**
     Invokes the ListCustomersGet operation returning immediately and passing the response to a callback.

     - Parameters:
         - input: The validated ListCustomersGetRequest object being passed to this operation.
         - completion: The ListCustomersResponse object or an error will be passed to this 
           callback when the operation is complete. The ListCustomersResponse
           object will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    func listCustomersGetAsync(
            input: EmptyExampleModel.ListCustomersGetRequest, 
            completion: @escaping (Result<EmptyExampleModel.ListCustomersResponse, EmptyExampleError>) -> ()) throws

    /**
     Invokes the ListCustomersGet operation waiting for the response before returning.

     - Parameters:
         - input: The validated ListCustomersGetRequest object being passed to this operation.
     - Returns: The ListCustomersResponse object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
     - Throws: unknownResource.
     */
    func listCustomersGetSync(
            input: EmptyExampleModel.ListCustomersGetRequest) throws -> EmptyExampleModel.ListCustomersResponse
}
