// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment type_body_length
// -- Generated Code; do not edit --
//
// MockPersistenceExampleClient.swift
// PersistenceExampleClient
//

import Foundation
import PersistenceExampleModel
import SmokeAWSCore
import SmokeHTTPClient

/**
 Mock Client for the PersistenceExample service by default returns the `__default` property of its return type.
 */
public struct MockPersistenceExampleClient: PersistenceExampleClientProtocol {
    let addCustomerEmailAddressAsyncOverride: AddCustomerEmailAddressAsyncType?
    let addCustomerEmailAddressSyncOverride: AddCustomerEmailAddressSyncType?
    let createCustomerPutAsyncOverride: CreateCustomerPutAsyncType?
    let createCustomerPutSyncOverride: CreateCustomerPutSyncType?
    let getCustomerDetailsAsyncOverride: GetCustomerDetailsAsyncType?
    let getCustomerDetailsSyncOverride: GetCustomerDetailsSyncType?
    let listCustomersGetAsyncOverride: ListCustomersGetAsyncType?
    let listCustomersGetSyncOverride: ListCustomersGetSyncType?

    /**
     Initializer that creates an instance of this clients. The behavior of individual
     functions can be overridden by passing them to this initializer.
     */
    public init(
            addCustomerEmailAddressAsync: AddCustomerEmailAddressAsyncType? = nil,
            addCustomerEmailAddressSync: AddCustomerEmailAddressSyncType? = nil,
            createCustomerPutAsync: CreateCustomerPutAsyncType? = nil,
            createCustomerPutSync: CreateCustomerPutSyncType? = nil,
            getCustomerDetailsAsync: GetCustomerDetailsAsyncType? = nil,
            getCustomerDetailsSync: GetCustomerDetailsSyncType? = nil,
            listCustomersGetAsync: ListCustomersGetAsyncType? = nil,
            listCustomersGetSync: ListCustomersGetSyncType? = nil) {
        self.addCustomerEmailAddressAsyncOverride = addCustomerEmailAddressAsync
        self.addCustomerEmailAddressSyncOverride = addCustomerEmailAddressSync
        self.createCustomerPutAsyncOverride = createCustomerPutAsync
        self.createCustomerPutSyncOverride = createCustomerPutSync
        self.getCustomerDetailsAsyncOverride = getCustomerDetailsAsync
        self.getCustomerDetailsSyncOverride = getCustomerDetailsSync
        self.listCustomersGetAsyncOverride = listCustomersGetAsync
        self.listCustomersGetSyncOverride = listCustomersGetSync
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
        if let addCustomerEmailAddressAsyncOverride = addCustomerEmailAddressAsyncOverride {
            return try addCustomerEmailAddressAsyncOverride(input, completion)
        }

        let result = CustomerEmailAddressIdentity.__default
        
        completion(.success(result))
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
        if let addCustomerEmailAddressSyncOverride = addCustomerEmailAddressSyncOverride {
            return try addCustomerEmailAddressSyncOverride(input)
        }

        return CustomerEmailAddressIdentity.__default
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
        if let createCustomerPutAsyncOverride = createCustomerPutAsyncOverride {
            return try createCustomerPutAsyncOverride(input, completion)
        }

        let result = CreateCustomerPut200Response.__default
        
        completion(.success(result))
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
        if let createCustomerPutSyncOverride = createCustomerPutSyncOverride {
            return try createCustomerPutSyncOverride(input)
        }

        return CreateCustomerPut200Response.__default
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
        if let getCustomerDetailsAsyncOverride = getCustomerDetailsAsyncOverride {
            return try getCustomerDetailsAsyncOverride(input, completion)
        }

        let result = CustomerAttributes.__default
        
        completion(.success(result))
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
        if let getCustomerDetailsSyncOverride = getCustomerDetailsSyncOverride {
            return try getCustomerDetailsSyncOverride(input)
        }

        return CustomerAttributes.__default
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
        if let listCustomersGetAsyncOverride = listCustomersGetAsyncOverride {
            return try listCustomersGetAsyncOverride(input, completion)
        }

        let result = ListCustomersResponse.__default
        
        completion(.success(result))
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
        if let listCustomersGetSyncOverride = listCustomersGetSyncOverride {
            return try listCustomersGetSyncOverride(input)
        }

        return ListCustomersResponse.__default
    }
}
