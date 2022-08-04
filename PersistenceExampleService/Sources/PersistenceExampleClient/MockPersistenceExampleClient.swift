// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
// swiftlint:disable type_body_length function_body_length generic_type_name cyclomatic_complexity
// -- Generated Code; do not edit --
//
// MockPersistenceExampleClient.swift
// PersistenceExampleClient
//

import Foundation
import PersistenceExampleModel
import SmokeAWSCore
import SmokeHTTPClient
import SmokeAWSHttp

/**
 Mock Client for the PersistenceExample service.
 
 At initialization, a function override directly returning a result can be provided for each API on this client.
 
 If the function override is provided, the corresponding API on this client will return the result provided by
 this override or will throw any error thrown by the override.
 
 Otherwise, the API will return the `__default` property of its return type.
 */
public struct MockPersistenceExampleClient: PersistenceExampleClientProtocol, MockClientProtocol {
    let typedErrorProvider: (Swift.Error) -> PersistenceExampleError = { $0.asTypedError() }
    let addCustomerEmailAddressFunctionOverride: AddCustomerEmailAddressFunctionType?
    let createCustomerPutFunctionOverride: CreateCustomerPutFunctionType?
    let getCustomerDetailsFunctionOverride: GetCustomerDetailsFunctionType?
    let listCustomersGetFunctionOverride: ListCustomersGetFunctionType?

    /**
     Initializer that creates an instance of this clients. The behavior of individual
     functions can be overridden by passing them to this initializer.
     */
    public init(
            addCustomerEmailAddress: AddCustomerEmailAddressFunctionType? = nil,
            createCustomerPut: CreateCustomerPutFunctionType? = nil,
            getCustomerDetails: GetCustomerDetailsFunctionType? = nil,
            listCustomersGet: ListCustomersGetFunctionType? = nil) {
        self.addCustomerEmailAddressFunctionOverride = addCustomerEmailAddress
        self.createCustomerPutFunctionOverride = createCustomerPut
        self.getCustomerDetailsFunctionOverride = getCustomerDetails
        self.listCustomersGetFunctionOverride = listCustomersGet
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
        if let functionOverride = self.addCustomerEmailAddressFunctionOverride {
            return try await functionOverride(input)
        }
        
        return CustomerEmailAddressIdentity.__default
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
        if let functionOverride = self.createCustomerPutFunctionOverride {
            return try await functionOverride(input)
        }
        
        return CreateCustomerPut200Response.__default
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
        if let functionOverride = self.getCustomerDetailsFunctionOverride {
            return try await functionOverride(input)
        }
        
        return CustomerAttributes.__default
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
        if let functionOverride = self.listCustomersGetFunctionOverride {
            return try await functionOverride(input)
        }
        
        return ListCustomersResponse.__default
    }
}
