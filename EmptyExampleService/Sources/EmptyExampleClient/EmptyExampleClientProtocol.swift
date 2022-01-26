// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
// swiftlint:disable type_body_length function_body_length generic_type_name cyclomatic_complexity
// -- Generated Code; do not edit --
//
// EmptyExampleClientProtocol.swift
// EmptyExampleClient
//

import Foundation
import EmptyExampleModel
import SmokeAWSCore
import SmokeHTTPClient
import NIO

/**
 Client Protocol for the EmptyExample service.
 */
public protocol EmptyExampleClientProtocol {
    typealias AddCustomerEmailAddressEventLoopFutureAsyncType = (
            _ input: EmptyExampleModel.AddCustomerEmailAddressRequest) -> EventLoopFuture<EmptyExampleModel.CustomerEmailAddressIdentity>
    typealias CreateCustomerPutEventLoopFutureAsyncType = (
            _ input: EmptyExampleModel.CreateCustomerRequest) -> EventLoopFuture<EmptyExampleModel.CreateCustomerPut200Response>
    typealias GetCustomerDetailsEventLoopFutureAsyncType = (
            _ input: EmptyExampleModel.GetCustomerDetailsRequest) -> EventLoopFuture<EmptyExampleModel.CustomerAttributes>
    typealias ListCustomersGetEventLoopFutureAsyncType = (
            _ input: EmptyExampleModel.ListCustomersGetRequest) -> EventLoopFuture<EmptyExampleModel.ListCustomersResponse>
    #if (os(Linux) && compiler(>=5.5)) || (!os(Linux) && compiler(>=5.5.2)) && canImport(_Concurrency)
    typealias AddCustomerEmailAddressFunctionType = (
            _ input: EmptyExampleModel.AddCustomerEmailAddressRequest) async throws -> EmptyExampleModel.CustomerEmailAddressIdentity
    typealias CreateCustomerPutFunctionType = (
            _ input: EmptyExampleModel.CreateCustomerRequest) async throws -> EmptyExampleModel.CreateCustomerPut200Response
    typealias GetCustomerDetailsFunctionType = (
            _ input: EmptyExampleModel.GetCustomerDetailsRequest) async throws -> EmptyExampleModel.CustomerAttributes
    typealias ListCustomersGetFunctionType = (
            _ input: EmptyExampleModel.ListCustomersGetRequest) async throws -> EmptyExampleModel.ListCustomersResponse
    #else
    typealias AddCustomerEmailAddressFunctionType = (
            _ input: EmptyExampleModel.AddCustomerEmailAddressRequest) throws -> EmptyExampleModel.CustomerEmailAddressIdentity
    typealias CreateCustomerPutFunctionType = (
            _ input: EmptyExampleModel.CreateCustomerRequest) throws -> EmptyExampleModel.CreateCustomerPut200Response
    typealias GetCustomerDetailsFunctionType = (
            _ input: EmptyExampleModel.GetCustomerDetailsRequest) throws -> EmptyExampleModel.CustomerAttributes
    typealias ListCustomersGetFunctionType = (
            _ input: EmptyExampleModel.ListCustomersGetRequest) throws -> EmptyExampleModel.ListCustomersResponse
    #endif

    /**
     Invokes the AddCustomerEmailAddress operation returning immediately with an `EventLoopFuture` that will be completed at a later time.

     - Parameters:
         - input: The validated AddCustomerEmailAddressRequest object being passed to this operation.
     - Returns: A future to the CustomerEmailAddressIdentity object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
           The possible errors are: concurrency, customerEmailAddressAlreadyExists, customerEmailAddressLimitExceeded, unknownResource.
     */
    func addCustomerEmailAddress(
            input: EmptyExampleModel.AddCustomerEmailAddressRequest) -> EventLoopFuture<EmptyExampleModel.CustomerEmailAddressIdentity>

    /**
     Invokes the CreateCustomerPut operation returning immediately with an `EventLoopFuture` that will be completed at a later time.

     - Parameters:
         - input: The validated CreateCustomerRequest object being passed to this operation.
     - Returns: A future to the CreateCustomerPut200Response object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    func createCustomerPut(
            input: EmptyExampleModel.CreateCustomerRequest) -> EventLoopFuture<EmptyExampleModel.CreateCustomerPut200Response>

    /**
     Invokes the GetCustomerDetails operation returning immediately with an `EventLoopFuture` that will be completed at a later time.

     - Parameters:
         - input: The validated GetCustomerDetailsRequest object being passed to this operation.
     - Returns: A future to the CustomerAttributes object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    func getCustomerDetails(
            input: EmptyExampleModel.GetCustomerDetailsRequest) -> EventLoopFuture<EmptyExampleModel.CustomerAttributes>

    /**
     Invokes the ListCustomersGet operation returning immediately with an `EventLoopFuture` that will be completed at a later time.

     - Parameters:
         - input: The validated ListCustomersGetRequest object being passed to this operation.
     - Returns: A future to the ListCustomersResponse object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    func listCustomersGet(
            input: EmptyExampleModel.ListCustomersGetRequest) -> EventLoopFuture<EmptyExampleModel.ListCustomersResponse>

    #if (os(Linux) && compiler(>=5.5)) || (!os(Linux) && compiler(>=5.5.2)) && canImport(_Concurrency)
    /**
     Invokes the AddCustomerEmailAddress operation returning asynchronously at a later time once the operation is complete.

     - Parameters:
         - input: The validated AddCustomerEmailAddressRequest object being passed to this operation.
     - Returns: The CustomerEmailAddressIdentity object to be passed back from the caller of this async operation.
         Will be validated before being returned to caller.
           The possible errors are: concurrency, customerEmailAddressAlreadyExists, customerEmailAddressLimitExceeded, unknownResource.
     */
    func addCustomerEmailAddress(
            input: EmptyExampleModel.AddCustomerEmailAddressRequest) async throws -> EmptyExampleModel.CustomerEmailAddressIdentity

    /**
     Invokes the CreateCustomerPut operation returning asynchronously at a later time once the operation is complete.

     - Parameters:
         - input: The validated CreateCustomerRequest object being passed to this operation.
     - Returns: The CreateCustomerPut200Response object to be passed back from the caller of this async operation.
         Will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    func createCustomerPut(
            input: EmptyExampleModel.CreateCustomerRequest) async throws -> EmptyExampleModel.CreateCustomerPut200Response

    /**
     Invokes the GetCustomerDetails operation returning asynchronously at a later time once the operation is complete.

     - Parameters:
         - input: The validated GetCustomerDetailsRequest object being passed to this operation.
     - Returns: The CustomerAttributes object to be passed back from the caller of this async operation.
         Will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    func getCustomerDetails(
            input: EmptyExampleModel.GetCustomerDetailsRequest) async throws -> EmptyExampleModel.CustomerAttributes

    /**
     Invokes the ListCustomersGet operation returning asynchronously at a later time once the operation is complete.

     - Parameters:
         - input: The validated ListCustomersGetRequest object being passed to this operation.
     - Returns: The ListCustomersResponse object to be passed back from the caller of this async operation.
         Will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    func listCustomersGet(
            input: EmptyExampleModel.ListCustomersGetRequest) async throws -> EmptyExampleModel.ListCustomersResponse
    #endif
}
