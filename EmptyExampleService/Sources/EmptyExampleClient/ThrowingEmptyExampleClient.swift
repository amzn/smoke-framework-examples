// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
// swiftlint:disable type_body_length function_body_length generic_type_name cyclomatic_complexity
// -- Generated Code; do not edit --
//
// ThrowingEmptyExampleClient.swift
// EmptyExampleClient
//

import Foundation
import EmptyExampleModel
import SmokeAWSCore
import SmokeHTTPClient
import NIO
import SmokeAWSHttp

/**
 Mock Client for the EmptyExample service.
 
 At initialization, a function override directly returning a result - which can be async for Swift 5.5 or greater - and/or
 an EventLoopFuture override returning an `EventLoopFuture` that will provide a result at a later time can be provided for each API
 on this client.
 
 If the function override is provided, the corresponding API on this client will return the result provided by
 this override or will throw any error thrown by the override.
 
 Otherwise, if the `EventLoopFuture` override is provided, the corresponding API on this client will return the result
 provided by the `EventLoopFuture` or will throw any error that fails the future. This override is ignored if the first
 function override is provided.
 
 Otherwise, the API will throw the error provided at initialization.
 */
public struct ThrowingEmptyExampleClient: EmptyExampleClientProtocol, MockThrowingClientProtocol {
    let error: EmptyExampleError
    let eventLoop: EventLoop
    let typedErrorProvider: (Swift.Error) -> EmptyExampleError = { $0.asTypedError() }
    let addCustomerEmailAddressEventLoopFutureAsyncOverride: AddCustomerEmailAddressEventLoopFutureAsyncType?
    let addCustomerEmailAddressFunctionOverride: AddCustomerEmailAddressFunctionType?
    let createCustomerPutEventLoopFutureAsyncOverride: CreateCustomerPutEventLoopFutureAsyncType?
    let createCustomerPutFunctionOverride: CreateCustomerPutFunctionType?
    let getCustomerDetailsEventLoopFutureAsyncOverride: GetCustomerDetailsEventLoopFutureAsyncType?
    let getCustomerDetailsFunctionOverride: GetCustomerDetailsFunctionType?
    let listCustomersGetEventLoopFutureAsyncOverride: ListCustomersGetEventLoopFutureAsyncType?
    let listCustomersGetFunctionOverride: ListCustomersGetFunctionType?

    /**
     Initializer that creates an instance of this clients. The behavior of individual
     functions can be overridden by passing them to this initializer.
     */
    public init(
            error: EmptyExampleError,
            eventLoop: EventLoop,
            addCustomerEmailAddressEventLoopFutureAsync: AddCustomerEmailAddressEventLoopFutureAsyncType? = nil,
            addCustomerEmailAddress: AddCustomerEmailAddressFunctionType? = nil,
            createCustomerPutEventLoopFutureAsync: CreateCustomerPutEventLoopFutureAsyncType? = nil,
            createCustomerPut: CreateCustomerPutFunctionType? = nil,
            getCustomerDetailsEventLoopFutureAsync: GetCustomerDetailsEventLoopFutureAsyncType? = nil,
            getCustomerDetails: GetCustomerDetailsFunctionType? = nil,
            listCustomersGetEventLoopFutureAsync: ListCustomersGetEventLoopFutureAsyncType? = nil,
            listCustomersGet: ListCustomersGetFunctionType? = nil) {
        self.error = error
        self.eventLoop = eventLoop
        
        self.addCustomerEmailAddressEventLoopFutureAsyncOverride = addCustomerEmailAddressEventLoopFutureAsync
        self.addCustomerEmailAddressFunctionOverride = addCustomerEmailAddress
        self.createCustomerPutEventLoopFutureAsyncOverride = createCustomerPutEventLoopFutureAsync
        self.createCustomerPutFunctionOverride = createCustomerPut
        self.getCustomerDetailsEventLoopFutureAsyncOverride = getCustomerDetailsEventLoopFutureAsync
        self.getCustomerDetailsFunctionOverride = getCustomerDetails
        self.listCustomersGetEventLoopFutureAsyncOverride = listCustomersGetEventLoopFutureAsync
        self.listCustomersGetFunctionOverride = listCustomersGet
    }

    /**
     Invokes the AddCustomerEmailAddress operation returning immediately with an `EventLoopFuture` that will be completed at a later time.

     - Parameters:
         - input: The validated AddCustomerEmailAddressRequest object being passed to this operation.
     - Returns: A future to the CustomerEmailAddressIdentity object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
           The possible errors are: concurrency, customerEmailAddressAlreadyExists, customerEmailAddressLimitExceeded, unknownResource.
     */
    public func addCustomerEmailAddress(
            input: EmptyExampleModel.AddCustomerEmailAddressRequest) -> EventLoopFuture<EmptyExampleModel.CustomerEmailAddressIdentity> {
        #if compiler(>=5.5) && canImport(_Concurrency)
            if #available(macOS 12, iOS 15, tvOS 15, watchOS 8, *) {
                return mockThrowingAsyncAwareEventLoopFutureExecuteWithInputWithOutput(
                    input: input,
                    defaultError: self.error,
                    eventLoop: self.eventLoop,
                    functionOverride: self.addCustomerEmailAddressFunctionOverride,
                    eventLoopFutureFunctionOverride: self.addCustomerEmailAddressEventLoopFutureAsyncOverride)
            } else {
                fatalError( "Swift >=5.5 unsupported below (macOS 12, iOS 15, tvOS 15, watchOS 8)")
            }
        #else
            return mockThrowingEventLoopFutureExecuteWithInputWithOutput(
                input: input,
                defaultError: self.error,
                eventLoop: self.eventLoop,
                functionOverride: self.addCustomerEmailAddressFunctionOverride,
                eventLoopFutureFunctionOverride: self.addCustomerEmailAddressEventLoopFutureAsyncOverride)
        #endif
    }

    /**
     Invokes the CreateCustomerPut operation returning immediately with an `EventLoopFuture` that will be completed at a later time.

     - Parameters:
         - input: The validated CreateCustomerRequest object being passed to this operation.
     - Returns: A future to the CreateCustomerPut200Response object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    public func createCustomerPut(
            input: EmptyExampleModel.CreateCustomerRequest) -> EventLoopFuture<EmptyExampleModel.CreateCustomerPut200Response> {
        #if compiler(>=5.5) && canImport(_Concurrency)
            if #available(macOS 12, iOS 15, tvOS 15, watchOS 8, *) {
                return mockThrowingAsyncAwareEventLoopFutureExecuteWithInputWithOutput(
                    input: input,
                    defaultError: self.error,
                    eventLoop: self.eventLoop,
                    functionOverride: self.createCustomerPutFunctionOverride,
                    eventLoopFutureFunctionOverride: self.createCustomerPutEventLoopFutureAsyncOverride)
            } else {
                fatalError( "Swift >=5.5 unsupported below (macOS 12, iOS 15, tvOS 15, watchOS 8)")
            }
        #else
            return mockThrowingEventLoopFutureExecuteWithInputWithOutput(
                input: input,
                defaultError: self.error,
                eventLoop: self.eventLoop,
                functionOverride: self.createCustomerPutFunctionOverride,
                eventLoopFutureFunctionOverride: self.createCustomerPutEventLoopFutureAsyncOverride)
        #endif
    }

    /**
     Invokes the GetCustomerDetails operation returning immediately with an `EventLoopFuture` that will be completed at a later time.

     - Parameters:
         - input: The validated GetCustomerDetailsRequest object being passed to this operation.
     - Returns: A future to the CustomerAttributes object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    public func getCustomerDetails(
            input: EmptyExampleModel.GetCustomerDetailsRequest) -> EventLoopFuture<EmptyExampleModel.CustomerAttributes> {
        #if compiler(>=5.5) && canImport(_Concurrency)
            if #available(macOS 12, iOS 15, tvOS 15, watchOS 8, *) {
                return mockThrowingAsyncAwareEventLoopFutureExecuteWithInputWithOutput(
                    input: input,
                    defaultError: self.error,
                    eventLoop: self.eventLoop,
                    functionOverride: self.getCustomerDetailsFunctionOverride,
                    eventLoopFutureFunctionOverride: self.getCustomerDetailsEventLoopFutureAsyncOverride)
            } else {
                fatalError( "Swift >=5.5 unsupported below (macOS 12, iOS 15, tvOS 15, watchOS 8)")
            }
        #else
            return mockThrowingEventLoopFutureExecuteWithInputWithOutput(
                input: input,
                defaultError: self.error,
                eventLoop: self.eventLoop,
                functionOverride: self.getCustomerDetailsFunctionOverride,
                eventLoopFutureFunctionOverride: self.getCustomerDetailsEventLoopFutureAsyncOverride)
        #endif
    }

    /**
     Invokes the ListCustomersGet operation returning immediately with an `EventLoopFuture` that will be completed at a later time.

     - Parameters:
         - input: The validated ListCustomersGetRequest object being passed to this operation.
     - Returns: A future to the ListCustomersResponse object to be passed back from the caller of this operation.
         Will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    public func listCustomersGet(
            input: EmptyExampleModel.ListCustomersGetRequest) -> EventLoopFuture<EmptyExampleModel.ListCustomersResponse> {
        #if compiler(>=5.5) && canImport(_Concurrency)
            if #available(macOS 12, iOS 15, tvOS 15, watchOS 8, *) {
                return mockThrowingAsyncAwareEventLoopFutureExecuteWithInputWithOutput(
                    input: input,
                    defaultError: self.error,
                    eventLoop: self.eventLoop,
                    functionOverride: self.listCustomersGetFunctionOverride,
                    eventLoopFutureFunctionOverride: self.listCustomersGetEventLoopFutureAsyncOverride)
            } else {
                fatalError( "Swift >=5.5 unsupported below (macOS 12, iOS 15, tvOS 15, watchOS 8)")
            }
        #else
            return mockThrowingEventLoopFutureExecuteWithInputWithOutput(
                input: input,
                defaultError: self.error,
                eventLoop: self.eventLoop,
                functionOverride: self.listCustomersGetFunctionOverride,
                eventLoopFutureFunctionOverride: self.listCustomersGetEventLoopFutureAsyncOverride)
        #endif
    }

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
    public func addCustomerEmailAddress(
            input: EmptyExampleModel.AddCustomerEmailAddressRequest) async throws -> EmptyExampleModel.CustomerEmailAddressIdentity {
        return try await mockThrowingExecuteWithInputWithOutput(
            input: input,
            defaultError: self.error,
            eventLoop: self.eventLoop,
            functionOverride: self.addCustomerEmailAddressFunctionOverride,
            eventLoopFutureFunctionOverride: self.addCustomerEmailAddressEventLoopFutureAsyncOverride)
    }

    /**
     Invokes the CreateCustomerPut operation returning aynchronously at a later time once the operation is complete.

     - Parameters:
         - input: The validated CreateCustomerRequest object being passed to this operation.
     - Returns: The CreateCustomerPut200Response object to be passed back from the caller of this async operation.
         Will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    @available(macOS 12, iOS 15, tvOS 15, watchOS 8, *)
    public func createCustomerPut(
            input: EmptyExampleModel.CreateCustomerRequest) async throws -> EmptyExampleModel.CreateCustomerPut200Response {
        return try await mockThrowingExecuteWithInputWithOutput(
            input: input,
            defaultError: self.error,
            eventLoop: self.eventLoop,
            functionOverride: self.createCustomerPutFunctionOverride,
            eventLoopFutureFunctionOverride: self.createCustomerPutEventLoopFutureAsyncOverride)
    }

    /**
     Invokes the GetCustomerDetails operation returning aynchronously at a later time once the operation is complete.

     - Parameters:
         - input: The validated GetCustomerDetailsRequest object being passed to this operation.
     - Returns: The CustomerAttributes object to be passed back from the caller of this async operation.
         Will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    @available(macOS 12, iOS 15, tvOS 15, watchOS 8, *)
    public func getCustomerDetails(
            input: EmptyExampleModel.GetCustomerDetailsRequest) async throws -> EmptyExampleModel.CustomerAttributes {
        return try await mockThrowingExecuteWithInputWithOutput(
            input: input,
            defaultError: self.error,
            eventLoop: self.eventLoop,
            functionOverride: self.getCustomerDetailsFunctionOverride,
            eventLoopFutureFunctionOverride: self.getCustomerDetailsEventLoopFutureAsyncOverride)
    }

    /**
     Invokes the ListCustomersGet operation returning aynchronously at a later time once the operation is complete.

     - Parameters:
         - input: The validated ListCustomersGetRequest object being passed to this operation.
     - Returns: The ListCustomersResponse object to be passed back from the caller of this async operation.
         Will be validated before being returned to caller.
           The possible errors are: unknownResource.
     */
    @available(macOS 12, iOS 15, tvOS 15, watchOS 8, *)
    public func listCustomersGet(
            input: EmptyExampleModel.ListCustomersGetRequest) async throws -> EmptyExampleModel.ListCustomersResponse {
        return try await mockThrowingExecuteWithInputWithOutput(
            input: input,
            defaultError: self.error,
            eventLoop: self.eventLoop,
            functionOverride: self.listCustomersGetFunctionOverride,
            eventLoopFutureFunctionOverride: self.listCustomersGetEventLoopFutureAsyncOverride)
    }
    #endif
}
