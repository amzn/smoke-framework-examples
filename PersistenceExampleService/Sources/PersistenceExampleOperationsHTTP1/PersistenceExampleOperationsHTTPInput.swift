// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
// swiftlint:disable type_body_length function_body_length generic_type_name cyclomatic_complexity
// -- Generated Code; do not edit --
//
// PersistenceExampleOperationsHTTPInput.swift
// PersistenceExampleOperationsHTTP1
//

import Foundation
import SmokeOperationsHTTP1
import PersistenceExampleModel
import SmokeOperations

/**
 Type to handle the http input to the AddCustomerEmailAddress operation.
 */
extension AddCustomerEmailAddressRequest: OperationHTTP1InputProtocol {
    public typealias QueryType = String
    public typealias PathType = AddCustomerEmailAddressOperationInputPath
    public typealias BodyType = AddCustomerEmailAddressOperationInputBody
    public typealias HeadersType = String

    public static func compose(queryDecodableProvider: () throws -> QueryType,
                               pathDecodableProvider: () throws -> PathType,
                               bodyDecodableProvider: () throws -> BodyType,
                               headersDecodableProvider: () throws -> HeadersType) throws -> AddCustomerEmailAddressRequest {
        let path = try pathDecodableProvider()
        let body = try bodyDecodableProvider()

        return PersistenceExampleModel.AddCustomerEmailAddressRequest(
            emailAddress: body.emailAddress,
            id: path.id,
            isPrimary: body.isPrimary,
            notifyOnAllActions: body.notifyOnAllActions,
            notifyOnImportantAction: body.notifyOnImportantAction)
    }
}

/**
 Type to handle the http input to the CreateCustomerPut operation.
 */
extension CreateCustomerRequest: OperationHTTP1InputProtocol {
    public typealias QueryType = CreateCustomerRequest
    public typealias PathType = CreateCustomerRequest
    public typealias BodyType = CreateCustomerRequest
    public typealias HeadersType = CreateCustomerRequest

    public static func compose(queryDecodableProvider: () throws -> QueryType,
                               pathDecodableProvider: () throws -> PathType,
                               bodyDecodableProvider: () throws -> BodyType,
                               headersDecodableProvider: () throws -> HeadersType) throws -> CreateCustomerRequest {
        return try bodyDecodableProvider()
    }
}

/**
 Type to handle the http input to the GetCustomerDetails operation.
 */
extension GetCustomerDetailsRequest: OperationHTTP1InputProtocol {
    public typealias QueryType = GetCustomerDetailsOperationInputQuery
    public typealias PathType = GetCustomerDetailsOperationInputPath
    public typealias BodyType = String
    public typealias HeadersType = GetCustomerDetailsOperationInputAdditionalHeaders

    public static func compose(queryDecodableProvider: () throws -> QueryType,
                               pathDecodableProvider: () throws -> PathType,
                               bodyDecodableProvider: () throws -> BodyType,
                               headersDecodableProvider: () throws -> HeadersType) throws -> GetCustomerDetailsRequest {
        let query = try queryDecodableProvider()
        let path = try pathDecodableProvider()
        let headers = try headersDecodableProvider()

        return PersistenceExampleModel.GetCustomerDetailsRequest(
            xRequestID: headers.xRequestID,
            id: path.id,
            includeOnlyPrimaryEmail: query.includeOnlyPrimaryEmail)
    }
}

/**
 Type to handle the http input to the ListCustomersGet operation.
 */
extension ListCustomersGetRequest: OperationHTTP1InputProtocol {
    public typealias QueryType = ListCustomersGetRequest
    public typealias PathType = ListCustomersGetRequest
    public typealias BodyType = ListCustomersGetRequest
    public typealias HeadersType = ListCustomersGetRequest

    public static func compose(queryDecodableProvider: () throws -> QueryType,
                               pathDecodableProvider: () throws -> PathType,
                               bodyDecodableProvider: () throws -> BodyType,
                               headersDecodableProvider: () throws -> HeadersType) throws -> ListCustomersGetRequest {
        return try queryDecodableProvider()
    }
}
