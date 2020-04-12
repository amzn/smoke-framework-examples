// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
// -- Generated Code; do not edit --
//
// EmptyExampleModelOperations.swift
// EmptyExampleModel
//

import Foundation
import SmokeOperations

/**
 Operation enumeration for the EmptyExampleModel.
 */
public enum EmptyExampleModelOperations: String, Hashable, CustomStringConvertible {
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
    func asEmptyExampleModelAddCustomerEmailAddressOperationInputPath() -> AddCustomerEmailAddressOperationInputPath {
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
                isPrimary: AddCustomerEmailAddressRequestBodyIsPrimary?,
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
    func asEmptyExampleModelAddCustomerEmailAddressOperationInputBody() -> AddCustomerEmailAddressOperationInputBody {
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

    public init(id: CreateCustomerPut200ResponseBodyId?) {
        self.id = id
    }

    enum CodingKeys: String, CodingKey {
        case id
    }

    public func validate() throws {
    }
}

public extension CreateCustomerPut200Response {
    func asEmptyExampleModelCreateCustomerPutOperationOutputBody() -> CreateCustomerPutOperationOutputBody {
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

    public init(xRequestID: CreateCustomerPutXRequestIDHeader?) {
        self.xRequestID = xRequestID
    }

    enum CodingKeys: String, CodingKey {
        case xRequestID = "X-Request-ID"
    }

    public func validate() throws {
    }
}

public extension CreateCustomerPut200Response {
    func asEmptyExampleModelCreateCustomerPutOperationOutputHeaders() -> CreateCustomerPutOperationOutputHeaders {
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
    func asEmptyExampleModelGetCustomerDetailsOperationInputPath() -> GetCustomerDetailsOperationInputPath {
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

    public init(includeOnlyPrimaryEmail: GetCustomerDetailsRequestIncludeOnlyPrimaryEmail?) {
        self.includeOnlyPrimaryEmail = includeOnlyPrimaryEmail
    }

    enum CodingKeys: String, CodingKey {
        case includeOnlyPrimaryEmail
    }

    public func validate() throws {
    }
}

public extension GetCustomerDetailsRequest {
    func asEmptyExampleModelGetCustomerDetailsOperationInputQuery() -> GetCustomerDetailsOperationInputQuery {
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

    public init(xRequestID: GetCustomerDetailsRequestXRequestID?) {
        self.xRequestID = xRequestID
    }

    enum CodingKeys: String, CodingKey {
        case xRequestID = "X-Request-ID"
    }

    public func validate() throws {
    }
}

public extension GetCustomerDetailsRequest {
    func asEmptyExampleModelGetCustomerDetailsOperationInputAdditionalHeaders() -> GetCustomerDetailsOperationInputAdditionalHeaders {
        return GetCustomerDetailsOperationInputAdditionalHeaders(
            xRequestID: xRequestID)
    }
}
