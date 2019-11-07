// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
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
// PersistenceExampleModelOperations.swift
// PersistenceExampleModel
//

import Foundation
import SmokeOperations

/**
 Operation enumeration for the PersistenceExampleModel.
 */
public enum PersistenceExampleModelOperations: String {
    case addCustomerEmailAddress = "AddCustomerEmailAddress"
    case createCustomerPut = "CreateCustomerPut"
    case getCustomerDetails = "GetCustomerDetails"
    case listCustomersGet = "ListCustomersGet"

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
    func asPersistenceExampleModelGetCustomerDetailsOperationInputAdditionalHeaders() -> GetCustomerDetailsOperationInputAdditionalHeaders {
        return GetCustomerDetailsOperationInputAdditionalHeaders(
            xRequestID: xRequestID)
    }
}
