// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
// swiftlint:disable type_body_length function_body_length generic_type_name cyclomatic_complexity
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
    typealias AddCustomerEmailAddressFunctionType = (
            _ input: PersistenceExampleModel.AddCustomerEmailAddressRequest) async throws -> PersistenceExampleModel.CustomerEmailAddressIdentity
    typealias CreateCustomerPutFunctionType = (
            _ input: PersistenceExampleModel.CreateCustomerRequest) async throws -> PersistenceExampleModel.CreateCustomerPut200Response
    typealias GetCustomerDetailsFunctionType = (
            _ input: PersistenceExampleModel.GetCustomerDetailsRequest) async throws -> PersistenceExampleModel.CustomerAttributes
    typealias ListCustomersGetFunctionType = (
            _ input: PersistenceExampleModel.ListCustomersGetRequest) async throws -> PersistenceExampleModel.ListCustomersResponse

    /**
     Invokes the AddCustomerEmailAddress operation returning asynchronously at a later time once the operation is complete.

     - Parameters:
         - input: The validated AddCustomerEmailAddressRequest object being passed to this operation.
     - Returns: The CustomerEmailAddressIdentity object to be passed back from the caller of this async operation.
         Will be validated before being returned to caller.
           The possible errors are: concurrency, customerEmailAddressAlreadyExists, customerEmailAddressLimitExceeded, unknownResource.
     */
    func addCustomerEmailAddress(
            input: PersistenceExampleModel.AddCustomerEmailAddressRequest) async throws -> PersistenceExampleModel.CustomerEmailAddressIdentity

    /**
     Invokes the CreateCustomerPut operation returning asynchronously at a later time once the operation is complete.

     - Parameters:
         - input: The validated CreateCustomerRequest object being passed to this operation.
     - Returns: The CreateCustomerPut200Response object to be passed back from the caller of this async operation.
         Will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    func createCustomerPut(
            input: PersistenceExampleModel.CreateCustomerRequest) async throws -> PersistenceExampleModel.CreateCustomerPut200Response

    /**
     Invokes the GetCustomerDetails operation returning asynchronously at a later time once the operation is complete.

     - Parameters:
         - input: The validated GetCustomerDetailsRequest object being passed to this operation.
     - Returns: The CustomerAttributes object to be passed back from the caller of this async operation.
         Will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    func getCustomerDetails(
            input: PersistenceExampleModel.GetCustomerDetailsRequest) async throws -> PersistenceExampleModel.CustomerAttributes

    /**
     Invokes the ListCustomersGet operation returning asynchronously at a later time once the operation is complete.

     - Parameters:
         - input: The validated ListCustomersGetRequest object being passed to this operation.
     - Returns: The ListCustomersResponse object to be passed back from the caller of this async operation.
         Will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    func listCustomersGet(
            input: PersistenceExampleModel.ListCustomersGetRequest) async throws -> PersistenceExampleModel.ListCustomersResponse
}
