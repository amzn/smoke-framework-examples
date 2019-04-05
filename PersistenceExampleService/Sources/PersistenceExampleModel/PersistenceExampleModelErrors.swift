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
// PersistenceExampleModelErrors.swift
// PersistenceExampleModel
//

import Foundation
import LoggerAPI
import SmokeOperations

private let validationErrorIdentityBuiltIn = "ValidationError"

private let concurrencyIdentity = "ConcurrencyFault"
private let customerEmailAddressAlreadyExistsIdentity = "CustomerEmailAddressAlreadyExistsFault"
private let customerEmailAddressLimitExceededIdentity = "CustomerEmailAddressLimitExceededFault"
private let unknownResourceIdentity = "UnknownResourceFault"

public enum PersistenceExampleCodingError: Swift.Error {
    case unknownError
    case unrecognizedError(String, String?)
}

public enum PersistenceExampleError: Swift.Error, Decodable {
    case concurrency(ConcurrencyFault)
    case customerEmailAddressAlreadyExists(CustomerEmailAddressAlreadyExistsFault)
    case customerEmailAddressLimitExceeded(CustomerEmailAddressLimitExceededFault)
    case unknownResource(UnknownResourceFault)

    enum CodingKeys: String, CodingKey {
        case type = "__type"
        case errorMessage = "message"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let type = try values.decodeIfPresent(String.self, forKey: .type)
        let errorMessage = try values.decodeIfPresent(String.self, forKey: .errorMessage)
        
        guard let errorReason = type else {
            throw PersistenceExampleCodingError.unknownError
        }

        switch errorReason {
        case concurrencyIdentity:
            let errorPayload = try ConcurrencyFault(from: decoder)
            self = PersistenceExampleError.concurrency(errorPayload)
        case customerEmailAddressAlreadyExistsIdentity:
            let errorPayload = try CustomerEmailAddressAlreadyExistsFault(from: decoder)
            self = PersistenceExampleError.customerEmailAddressAlreadyExists(errorPayload)
        case customerEmailAddressLimitExceededIdentity:
            let errorPayload = try CustomerEmailAddressLimitExceededFault(from: decoder)
            self = PersistenceExampleError.customerEmailAddressLimitExceeded(errorPayload)
        case unknownResourceIdentity:
            let errorPayload = try UnknownResourceFault(from: decoder)
            self = PersistenceExampleError.unknownResource(errorPayload)
        case validationErrorIdentityBuiltIn:
            let errorMessage = try values.decodeIfPresent(String.self, forKey: .errorMessage) ?? ""
            throw SmokeOperationsError.validationError(reason: errorMessage)
        default:
            throw PersistenceExampleCodingError.unrecognizedError(errorReason, errorMessage)
        }
    }
    
}

extension PersistenceExampleError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .concurrency:
            return concurrencyIdentity
        case .customerEmailAddressAlreadyExists:
            return customerEmailAddressAlreadyExistsIdentity
        case .customerEmailAddressLimitExceeded:
            return customerEmailAddressLimitExceededIdentity
        case .unknownResource:
            return unknownResourceIdentity
        }
    }
}

extension PersistenceExampleError: Encodable {
    public func encode(to encoder: Encoder) throws {
        switch self {
        case .concurrency(let details):
            try details.encode(to: encoder)
        case .customerEmailAddressAlreadyExists(let details):
            try details.encode(to: encoder)
        case .customerEmailAddressLimitExceeded(let details):
            try details.encode(to: encoder)
        case .unknownResource(let details):
            try details.encode(to: encoder)
        }
    }
}

public struct PersistenceExampleErrorTypes: OptionSet {
    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public static let concurrency = PersistenceExampleErrorTypes(rawValue: 1)
    public static let customerEmailAddressAlreadyExists = PersistenceExampleErrorTypes(rawValue: 2)
    public static let customerEmailAddressLimitExceeded = PersistenceExampleErrorTypes(rawValue: 3)
    public static let unknownResource = PersistenceExampleErrorTypes(rawValue: 4)
}

extension PersistenceExampleErrorTypes: ErrorIdentifiableByDescription {
    public var description: String {
        switch rawValue {
        case 1:
            return concurrencyIdentity
        case 2:
            return customerEmailAddressAlreadyExistsIdentity
        case 3:
            return customerEmailAddressLimitExceededIdentity
        case 4:
            return unknownResourceIdentity
        default:
            return ""
        }
    }
}
