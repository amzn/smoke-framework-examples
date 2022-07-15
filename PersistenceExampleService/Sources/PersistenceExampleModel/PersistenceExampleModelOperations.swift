// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
// swiftlint:disable type_body_length function_body_length generic_type_name cyclomatic_complexity
// -- Generated Code; do not edit --
//
// PersistenceExampleModelOperations.swift
// PersistenceExampleModel
//

import Foundation
import SmokeOperations

/**
 Operation enumeration for the PersistenceExampleModel.
 */
public enum PersistenceExampleModelOperations: String, Hashable, CustomStringConvertible {
    case addCustomerEmailAddress = "AddCustomerEmailAddress"
    case createCustomerPut = "CreateCustomerPut"
    case getCustomerDetails = "GetCustomerDetails"
    case listCustomersGet = "ListCustomersGet"

    public var description: String {
        return rawValue
    }

    public var operationPath: String {
        switch self {
        case .addCustomerEmailAddress:
            return "/customer/{id}/email"
        case .createCustomerPut:
            return "/customer"
        case .getCustomerDetails:
            return "/customer/{id}"
        case .listCustomersGet:
            return "/customer"
        }
    }

    public var allowedErrors: [PersistenceExampleErrorTypes] {
        switch self {
        case .addCustomerEmailAddress:
            return [.concurrency, .customerEmailAddressAlreadyExists, .customerEmailAddressLimitExceeded, .unknownResource]
        case .createCustomerPut:
            return [.unknownResource]
        case .getCustomerDetails:
            return [.unknownResource]
        case .listCustomersGet:
            return [.unknownResource]
        }
    }
}

/**
 Structure to encode the path input for the AddCustomerEmailAddress
 operation.
 */
public struct AddCustomerEmailAddressOperationInputPath: Codable, Equatable {
    public var id: AddCustomerEmailAddressRequestId

    public init(id: AddCustomerEmailAddressRequestId) {
        self.id = id
    }

    enum CodingKeys: String, CodingKey {
        case id
    }

    public func validate() throws {
    }
}

public extension AddCustomerEmailAddressRequest {
    func asPersistenceExampleModelAddCustomerEmailAddressOperationInputPath() -> AddCustomerEmailAddressOperationInputPath {
        return AddCustomerEmailAddressOperationInputPath(
            id: id)
    }
}

/**
 Structure to encode the body input for the AddCustomerEmailAddress
 operation.
 */
public struct AddCustomerEmailAddressOperationInputBody: Codable, Equatable {
    public var emailAddress: AddCustomerEmailAddressRequestBodyEmailAddress
    public var isPrimary: AddCustomerEmailAddressRequestBodyIsPrimary?
    public var notifyOnAllActions: AddCustomerEmailAddressRequestBodyNotifyOnAllActions
    public var notifyOnImportantAction: AddCustomerEmailAddressRequestBodyNotifyOnImportantAction

    public init(emailAddress: AddCustomerEmailAddressRequestBodyEmailAddress,
                isPrimary: AddCustomerEmailAddressRequestBodyIsPrimary? = nil,
                notifyOnAllActions: AddCustomerEmailAddressRequestBodyNotifyOnAllActions,
                notifyOnImportantAction: AddCustomerEmailAddressRequestBodyNotifyOnImportantAction) {
        self.emailAddress = emailAddress
        self.isPrimary = isPrimary
        self.notifyOnAllActions = notifyOnAllActions
        self.notifyOnImportantAction = notifyOnImportantAction
    }

    enum CodingKeys: String, CodingKey {
        case emailAddress
        case isPrimary
        case notifyOnAllActions
        case notifyOnImportantAction
    }

    public func validate() throws {
    }
}

public extension AddCustomerEmailAddressRequest {
    func asPersistenceExampleModelAddCustomerEmailAddressOperationInputBody() -> AddCustomerEmailAddressOperationInputBody {
        return AddCustomerEmailAddressOperationInputBody(
            emailAddress: emailAddress,
            isPrimary: isPrimary,
            notifyOnAllActions: notifyOnAllActions,
            notifyOnImportantAction: notifyOnImportantAction)
    }
}

/**
 Structure to encode the body input for the CreateCustomerPut
 operation.
 */
public struct CreateCustomerPutOperationOutputBody: Codable, Equatable {
    public var id: CreateCustomerPut200ResponseBodyId?

    public init(id: CreateCustomerPut200ResponseBodyId? = nil) {
        self.id = id
    }

    enum CodingKeys: String, CodingKey {
        case id
    }

    public func validate() throws {
    }
}

public extension CreateCustomerPut200Response {
    func asPersistenceExampleModelCreateCustomerPutOperationOutputBody() -> CreateCustomerPutOperationOutputBody {
        return CreateCustomerPutOperationOutputBody(
            id: id)
    }
}

/**
 Structure to encode the body input for the CreateCustomerPut
 operation.
 */
public struct CreateCustomerPutOperationOutputHeaders: Codable, Equatable {
    public var xRequestID: CreateCustomerPutXRequestIDHeader?

    public init(xRequestID: CreateCustomerPutXRequestIDHeader? = nil) {
        self.xRequestID = xRequestID
    }

    enum CodingKeys: String, CodingKey {
        case xRequestID = "X-Request-ID"
    }

    public func validate() throws {
    }
}

public extension CreateCustomerPut200Response {
    func asPersistenceExampleModelCreateCustomerPutOperationOutputHeaders() -> CreateCustomerPutOperationOutputHeaders {
        return CreateCustomerPutOperationOutputHeaders(
            xRequestID: xRequestID)
    }
}

/**
 Structure to encode the path input for the GetCustomerDetails
 operation.
 */
public struct GetCustomerDetailsOperationInputPath: Codable, Equatable {
    public var id: GetCustomerDetailsRequestId

    public init(id: GetCustomerDetailsRequestId) {
        self.id = id
    }

    enum CodingKeys: String, CodingKey {
        case id
    }

    public func validate() throws {
    }
}

public extension GetCustomerDetailsRequest {
    func asPersistenceExampleModelGetCustomerDetailsOperationInputPath() -> GetCustomerDetailsOperationInputPath {
        return GetCustomerDetailsOperationInputPath(
            id: id)
    }
}

/**
 Structure to encode the query input for the GetCustomerDetails
 operation.
 */
public struct GetCustomerDetailsOperationInputQuery: Codable, Equatable {
    public var includeOnlyPrimaryEmail: GetCustomerDetailsRequestIncludeOnlyPrimaryEmail?

    public init(includeOnlyPrimaryEmail: GetCustomerDetailsRequestIncludeOnlyPrimaryEmail? = nil) {
        self.includeOnlyPrimaryEmail = includeOnlyPrimaryEmail
    }

    enum CodingKeys: String, CodingKey {
        case includeOnlyPrimaryEmail
    }

    public func validate() throws {
    }
}

public extension GetCustomerDetailsRequest {
    func asPersistenceExampleModelGetCustomerDetailsOperationInputQuery() -> GetCustomerDetailsOperationInputQuery {
        return GetCustomerDetailsOperationInputQuery(
            includeOnlyPrimaryEmail: includeOnlyPrimaryEmail)
    }
}

/**
 Structure to encode the body input for the GetCustomerDetails
 operation.
 */
public struct GetCustomerDetailsOperationInputAdditionalHeaders: Codable, Equatable {
    public var xRequestID: GetCustomerDetailsRequestXRequestID?

    public init(xRequestID: GetCustomerDetailsRequestXRequestID? = nil) {
        self.xRequestID = xRequestID
    }

    enum CodingKeys: String, CodingKey {
        case xRequestID = "X-Request-ID"
    }

    public func validate() throws {
    }
}

public extension GetCustomerDetailsRequest {
    func asPersistenceExampleModelGetCustomerDetailsOperationInputAdditionalHeaders() -> GetCustomerDetailsOperationInputAdditionalHeaders {
        return GetCustomerDetailsOperationInputAdditionalHeaders(
            xRequestID: xRequestID)
    }
}
