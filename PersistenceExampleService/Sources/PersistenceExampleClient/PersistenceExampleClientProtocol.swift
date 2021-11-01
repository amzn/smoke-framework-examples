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
import NIO

/**
 Client Protocol for the PersistenceExample service.
 */
public protocol PersistenceExampleClientProtocol {
    typealias AddCustomerEmailAddressEventLoopFutureAsyncType = (
            _ input: PersistenceExampleModel.AddCustomerEmailAddressRequest) -> EventLoopFuture<PersistenceExampleModel.CustomerEmailAddressIdentity>
    typealias CreateCustomerPutEventLoopFutureAsyncType = (
            _ input: PersistenceExampleModel.CreateCustomerRequest) -> EventLoopFuture<PersistenceExampleModel.CreateCustomerPut200Response>
    typealias GetCustomerDetailsEventLoopFutureAsyncType = (
            _ input: PersistenceExampleModel.GetCustomerDetailsRequest) -> EventLoopFuture<PersistenceExampleModel.CustomerAttributes>
    typealias ListCustomersGetEventLoopFutureAsyncType = (
            _ input: PersistenceExampleModel.ListCustomersGetRequest) -> EventLoopFuture<PersistenceExampleModel.ListCustomersResponse>
    #if compiler(>=5.5) && canImport(_Concurrency)
    typealias AddCustomerEmailAddressFunctionType = (
            _ input: PersistenceExampleModel.AddCustomerEmailAddressRequest) async throws -> PersistenceExampleModel.CustomerEmailAddressIdentity
    typealias CreateCustomerPutFunctionType = (
            _ input: PersistenceExampleModel.CreateCustomerRequest) async throws -> PersistenceExampleModel.CreateCustomerPut200Response
    typealias GetCustomerDetailsFunctionType = (
            _ input: PersistenceExampleModel.GetCustomerDetailsRequest) async throws -> PersistenceExampleModel.CustomerAttributes
    typealias ListCustomersGetFunctionType = (
            _ input: PersistenceExampleModel.ListCustomersGetRequest) async throws -> PersistenceExampleModel.ListCustomersResponse
    #else
    typealias AddCustomerEmailAddressFunctionType = (
            _ input: PersistenceExampleModel.AddCustomerEmailAddressRequest) throws -> PersistenceExampleModel.CustomerEmailAddressIdentity
    typealias CreateCustomerPutFunctionType = (
            _ input: PersistenceExampleModel.CreateCustomerRequest) throws -> PersistenceExampleModel.CreateCustomerPut200Response
    typealias GetCustomerDetailsFunctionType = (
            _ input: PersistenceExampleModel.GetCustomerDetailsRequest) throws -> PersistenceExampleModel.CustomerAttributes
    typealias ListCustomersGetFunctionType = (
            _ input: PersistenceExampleModel.ListCustomersGetRequest) throws -> PersistenceExampleModel.ListCustomersResponse
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
            input: PersistenceExampleModel.AddCustomerEmailAddressRequest) -> EventLoopFuture<PersistenceExampleModel.CustomerEmailAddressIdentity>

    /**
     Invokes the CreateCustomerPut operation returning immediately with an `EventLoopFuture` that will be completed at a later time.

     - Parameters:
         - input: The validated CreateCustomerRequest object being passed to this operation.
     - Returns: A future to the CreateCustomerPut200Response object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    func createCustomerPut(
            input: PersistenceExampleModel.CreateCustomerRequest) -> EventLoopFuture<PersistenceExampleModel.CreateCustomerPut200Response>

    /**
     Invokes the GetCustomerDetails operation returning immediately with an `EventLoopFuture` that will be completed at a later time.

     - Parameters:
         - input: The validated GetCustomerDetailsRequest object being passed to this operation.
     - Returns: A future to the CustomerAttributes object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    func getCustomerDetails(
            input: PersistenceExampleModel.GetCustomerDetailsRequest) -> EventLoopFuture<PersistenceExampleModel.CustomerAttributes>

    /**
     Invokes the ListCustomersGet operation returning immediately with an `EventLoopFuture` that will be completed at a later time.

     - Parameters:
         - input: The validated ListCustomersGetRequest object being passed to this operation.
     - Returns: A future to the ListCustomersResponse object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    func listCustomersGet(
            input: PersistenceExampleModel.ListCustomersGetRequest) -> EventLoopFuture<PersistenceExampleModel.ListCustomersResponse>

    #if compiler(>=5.5) && canImport(_Concurrency)
    /**
     Invokes the AddCustomerEmailAddress operation returning aynchronously at a later time once the operation is complete.

     - Parameters:
         - input: The validated AddCustomerEmailAddressRequest object being passed to this operation.
     - Returns: The CustomerEmailAddressIdentity object to be passed back from the caller of this async operation.
         Will be validated before being returned to caller.
           The possible errors are: concurrency, customerEmailAddressAlreadyExists, customerEmailAddressLimitExceeded, unknownResource.
     */
    @available(macOS 12, iOS 15, tvOS 15, watchOS 8, *)
    func addCustomerEmailAddress(
            input: PersistenceExampleModel.AddCustomerEmailAddressRequest) async throws -> PersistenceExampleModel.CustomerEmailAddressIdentity

    /**
     Invokes the CreateCustomerPut operation returning aynchronously at a later time once the operation is complete.

     - Parameters:
         - input: The validated CreateCustomerRequest object being passed to this operation.
     - Returns: The CreateCustomerPut200Response object to be passed back from the caller of this async operation.
         Will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    @available(macOS 12, iOS 15, tvOS 15, watchOS 8, *)
    func createCustomerPut(
            input: PersistenceExampleModel.CreateCustomerRequest) async throws -> PersistenceExampleModel.CreateCustomerPut200Response

    /**
     Invokes the GetCustomerDetails operation returning aynchronously at a later time once the operation is complete.

     - Parameters:
         - input: The validated GetCustomerDetailsRequest object being passed to this operation.
     - Returns: The CustomerAttributes object to be passed back from the caller of this async operation.
         Will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    @available(macOS 12, iOS 15, tvOS 15, watchOS 8, *)
    func getCustomerDetails(
            input: PersistenceExampleModel.GetCustomerDetailsRequest) async throws -> PersistenceExampleModel.CustomerAttributes

    /**
     Invokes the ListCustomersGet operation returning aynchronously at a later time once the operation is complete.

     - Parameters:
         - input: The validated ListCustomersGetRequest object being passed to this operation.
     - Returns: The ListCustomersResponse object to be passed back from the caller of this async operation.
         Will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    @available(macOS 12, iOS 15, tvOS 15, watchOS 8, *)
    func listCustomersGet(
            input: PersistenceExampleModel.ListCustomersGetRequest) async throws -> PersistenceExampleModel.ListCustomersResponse
    #endif
}
