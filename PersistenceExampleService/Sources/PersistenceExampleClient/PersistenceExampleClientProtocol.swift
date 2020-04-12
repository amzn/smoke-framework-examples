// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment type_body_length
// -- Generated Code; do not edit --
//
// PersistenceExampleClientProtocol.swift
// PersistenceExampleClient
//

import Foundation
import PersistenceExampleModel
import SmokeAWSCore
import SmokeHTTPClient

/**
 Client Protocol for the PersistenceExample service.
 */
public protocol PersistenceExampleClientProtocol {
    typealias AddCustomerEmailAddressSyncType = (
            _ input: PersistenceExampleModel.AddCustomerEmailAddressRequest) throws -> PersistenceExampleModel.CustomerEmailAddressIdentity
    typealias AddCustomerEmailAddressAsyncType = (
            _ input: PersistenceExampleModel.AddCustomerEmailAddressRequest, 
            _ completion: @escaping (Result<PersistenceExampleModel.CustomerEmailAddressIdentity, PersistenceExampleError>) -> ()) throws -> ()
    typealias CreateCustomerPutSyncType = (
            _ input: PersistenceExampleModel.CreateCustomerRequest) throws -> PersistenceExampleModel.CreateCustomerPut200Response
    typealias CreateCustomerPutAsyncType = (
            _ input: PersistenceExampleModel.CreateCustomerRequest, 
            _ completion: @escaping (Result<PersistenceExampleModel.CreateCustomerPut200Response, PersistenceExampleError>) -> ()) throws -> ()
    typealias GetCustomerDetailsSyncType = (
            _ input: PersistenceExampleModel.GetCustomerDetailsRequest) throws -> PersistenceExampleModel.CustomerAttributes
    typealias GetCustomerDetailsAsyncType = (
            _ input: PersistenceExampleModel.GetCustomerDetailsRequest, 
            _ completion: @escaping (Result<PersistenceExampleModel.CustomerAttributes, PersistenceExampleError>) -> ()) throws -> ()
    typealias ListCustomersGetSyncType = (
            _ input: PersistenceExampleModel.ListCustomersGetRequest) throws -> PersistenceExampleModel.ListCustomersResponse
    typealias ListCustomersGetAsyncType = (
            _ input: PersistenceExampleModel.ListCustomersGetRequest, 
            _ completion: @escaping (Result<PersistenceExampleModel.ListCustomersResponse, PersistenceExampleError>) -> ()) throws -> ()

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
            input: PersistenceExampleModel.AddCustomerEmailAddressRequest, 
            completion: @escaping (Result<PersistenceExampleModel.CustomerEmailAddressIdentity, PersistenceExampleError>) -> ()) throws

    /**
     Invokes the AddCustomerEmailAddress operation waiting for the response before returning.

     - Parameters:
         - input: The validated AddCustomerEmailAddressRequest object being passed to this operation.
     - Returns: The CustomerEmailAddressIdentity object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
     - Throws: concurrency, customerEmailAddressAlreadyExists, customerEmailAddressLimitExceeded, unknownResource.
     */
    func addCustomerEmailAddressSync(
            input: PersistenceExampleModel.AddCustomerEmailAddressRequest) throws -> PersistenceExampleModel.CustomerEmailAddressIdentity

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
            input: PersistenceExampleModel.CreateCustomerRequest, 
            completion: @escaping (Result<PersistenceExampleModel.CreateCustomerPut200Response, PersistenceExampleError>) -> ()) throws

    /**
     Invokes the CreateCustomerPut operation waiting for the response before returning.

     - Parameters:
         - input: The validated CreateCustomerRequest object being passed to this operation.
     - Returns: The CreateCustomerPut200Response object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
     - Throws: unknownResource.
     */
    func createCustomerPutSync(
            input: PersistenceExampleModel.CreateCustomerRequest) throws -> PersistenceExampleModel.CreateCustomerPut200Response

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
            input: PersistenceExampleModel.GetCustomerDetailsRequest, 
            completion: @escaping (Result<PersistenceExampleModel.CustomerAttributes, PersistenceExampleError>) -> ()) throws

    /**
     Invokes the GetCustomerDetails operation waiting for the response before returning.

     - Parameters:
         - input: The validated GetCustomerDetailsRequest object being passed to this operation.
     - Returns: The CustomerAttributes object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
     - Throws: unknownResource.
     */
    func getCustomerDetailsSync(
            input: PersistenceExampleModel.GetCustomerDetailsRequest) throws -> PersistenceExampleModel.CustomerAttributes

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
            input: PersistenceExampleModel.ListCustomersGetRequest, 
            completion: @escaping (Result<PersistenceExampleModel.ListCustomersResponse, PersistenceExampleError>) -> ()) throws

    /**
     Invokes the ListCustomersGet operation waiting for the response before returning.

     - Parameters:
         - input: The validated ListCustomersGetRequest object being passed to this operation.
     - Returns: The ListCustomersResponse object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
     - Throws: unknownResource.
     */
    func listCustomersGetSync(
            input: PersistenceExampleModel.ListCustomersGetRequest) throws -> PersistenceExampleModel.ListCustomersResponse
}
