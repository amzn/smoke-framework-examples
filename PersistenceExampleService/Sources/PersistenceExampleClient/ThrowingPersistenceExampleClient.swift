// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment type_body_length
// -- Generated Code; do not edit --
//
// Copyright 2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//
// ThrowingPersistenceExampleClient.swift
// PersistenceExampleClient
//

import Foundation
import PersistenceExampleModel
import SmokeHTTPClient

/**
 Mock Client for the PersistenceExample service that by default always throws from its methods.
 */
public struct ThrowingPersistenceExampleClient: PersistenceExampleClientProtocol {
    let error: Swift.Error
    let addCustomerEmailAddressAsyncOverride: PersistenceExampleClientProtocol.AddCustomerEmailAddressAsyncType?
    let addCustomerEmailAddressSyncOverride: PersistenceExampleClientProtocol.AddCustomerEmailAddressSyncType?
    let createCustomerPutAsyncOverride: PersistenceExampleClientProtocol.CreateCustomerPutAsyncType?
    let createCustomerPutSyncOverride: PersistenceExampleClientProtocol.CreateCustomerPutSyncType?
    let getCustomerDetailsAsyncOverride: PersistenceExampleClientProtocol.GetCustomerDetailsAsyncType?
    let getCustomerDetailsSyncOverride: PersistenceExampleClientProtocol.GetCustomerDetailsSyncType?
    let listCustomersGetAsyncOverride: PersistenceExampleClientProtocol.ListCustomersGetAsyncType?
    let listCustomersGetSyncOverride: PersistenceExampleClientProtocol.ListCustomersGetSyncType?

    /**
     Initializer that creates an instance of this clients. The behavior of individual
     functions can be overridden by passing them to this initializer.
     */
    public init(error: Swift.Error,
            addCustomerEmailAddressAsync: PersistenceExampleClientProtocol.AddCustomerEmailAddressAsyncType? = nil,
            addCustomerEmailAddressSync: PersistenceExampleClientProtocol.AddCustomerEmailAddressSyncType? = nil,
            createCustomerPutAsync: PersistenceExampleClientProtocol.CreateCustomerPutAsyncType? = nil,
            createCustomerPutSync: PersistenceExampleClientProtocol.CreateCustomerPutSyncType? = nil,
            getCustomerDetailsAsync: PersistenceExampleClientProtocol.GetCustomerDetailsAsyncType? = nil,
            getCustomerDetailsSync: PersistenceExampleClientProtocol.GetCustomerDetailsSyncType? = nil,
            listCustomersGetAsync: PersistenceExampleClientProtocol.ListCustomersGetAsyncType? = nil,
            listCustomersGetSync: PersistenceExampleClientProtocol.ListCustomersGetSyncType? = nil) {
        self.error = error
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
    public func addCustomerEmailAddressAsync(input: PersistenceExampleModel.AddCustomerEmailAddressRequest, completion: @escaping (HTTPResult<PersistenceExampleModel.CustomerEmailAddressIdentity>) -> ()) throws {
        if let addCustomerEmailAddressAsyncOverride = addCustomerEmailAddressAsyncOverride {
            return try addCustomerEmailAddressAsyncOverride(input, completion)
        }

        completion(.error(error))
    }

    /**
     Invokes the AddCustomerEmailAddress operation waiting for the response before returning.

     - Parameters:
         - input: The validated AddCustomerEmailAddressRequest object being passed to this operation.
     - Returns: The CustomerEmailAddressIdentity object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
     - Throws: concurrency, customerEmailAddressAlreadyExists, customerEmailAddressLimitExceeded, unknownResource.
     */
    public func addCustomerEmailAddressSync(input: PersistenceExampleModel.AddCustomerEmailAddressRequest) throws -> PersistenceExampleModel.CustomerEmailAddressIdentity {
        if let addCustomerEmailAddressSyncOverride = addCustomerEmailAddressSyncOverride {
            return try addCustomerEmailAddressSyncOverride(input)
        }

        throw error
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
    public func createCustomerPutAsync(input: PersistenceExampleModel.CreateCustomerRequest, completion: @escaping (HTTPResult<PersistenceExampleModel.CreateCustomerPut200Response>) -> ()) throws {
        if let createCustomerPutAsyncOverride = createCustomerPutAsyncOverride {
            return try createCustomerPutAsyncOverride(input, completion)
        }

        completion(.error(error))
    }

    /**
     Invokes the CreateCustomerPut operation waiting for the response before returning.

     - Parameters:
         - input: The validated CreateCustomerRequest object being passed to this operation.
     - Returns: The CreateCustomerPut200Response object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
     - Throws: unknownResource.
     */
    public func createCustomerPutSync(input: PersistenceExampleModel.CreateCustomerRequest) throws -> PersistenceExampleModel.CreateCustomerPut200Response {
        if let createCustomerPutSyncOverride = createCustomerPutSyncOverride {
            return try createCustomerPutSyncOverride(input)
        }

        throw error
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
    public func getCustomerDetailsAsync(input: PersistenceExampleModel.GetCustomerDetailsRequest, completion: @escaping (HTTPResult<PersistenceExampleModel.CustomerAttributes>) -> ()) throws {
        if let getCustomerDetailsAsyncOverride = getCustomerDetailsAsyncOverride {
            return try getCustomerDetailsAsyncOverride(input, completion)
        }

        completion(.error(error))
    }

    /**
     Invokes the GetCustomerDetails operation waiting for the response before returning.

     - Parameters:
         - input: The validated GetCustomerDetailsRequest object being passed to this operation.
     - Returns: The CustomerAttributes object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
     - Throws: unknownResource.
     */
    public func getCustomerDetailsSync(input: PersistenceExampleModel.GetCustomerDetailsRequest) throws -> PersistenceExampleModel.CustomerAttributes {
        if let getCustomerDetailsSyncOverride = getCustomerDetailsSyncOverride {
            return try getCustomerDetailsSyncOverride(input)
        }

        throw error
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
    public func listCustomersGetAsync(input: PersistenceExampleModel.ListCustomersGetRequest, completion: @escaping (HTTPResult<PersistenceExampleModel.ListCustomersResponse>) -> ()) throws {
        if let listCustomersGetAsyncOverride = listCustomersGetAsyncOverride {
            return try listCustomersGetAsyncOverride(input, completion)
        }

        completion(.error(error))
    }

    /**
     Invokes the ListCustomersGet operation waiting for the response before returning.

     - Parameters:
         - input: The validated ListCustomersGetRequest object being passed to this operation.
     - Returns: The ListCustomersResponse object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
     - Throws: unknownResource.
     */
    public func listCustomersGetSync(input: PersistenceExampleModel.ListCustomersGetRequest) throws -> PersistenceExampleModel.ListCustomersResponse {
        if let listCustomersGetSyncOverride = listCustomersGetSyncOverride {
            return try listCustomersGetSyncOverride(input)
        }

        throw error
    }
}
