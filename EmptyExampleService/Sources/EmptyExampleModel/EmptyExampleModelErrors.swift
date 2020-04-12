// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
// -- Generated Code; do not edit --
//
// EmptyExampleModelErrors.swift
// EmptyExampleModel
//

import Foundation
import Logging

public typealias EmptyExampleErrorResult<SuccessPayload> = Result<SuccessPayload, EmptyExampleError>

public extension Swift.Error {
    func asUnrecognizedEmptyExampleError() -> EmptyExampleError {
        let errorType = String(describing: type(of: self))
        let errorDescription = String(describing: self)
        return .unrecognizedError(errorType, errorDescription)
    }
}
import SmokeOperations

private let validationErrorIdentityBuiltIn = "ValidationError"

private let concurrencyIdentity = "ConcurrencyFault"
private let customerEmailAddressAlreadyExistsIdentity = "CustomerEmailAddressAlreadyExistsFault"
private let customerEmailAddressLimitExceededIdentity = "CustomerEmailAddressLimitExceededFault"
private let unknownResourceIdentity = "UnknownResourceFault"
private let __validationErrorIdentity = "ValidationError"
private let __unrecognizedErrorIdentity = "UnrecognizedError"
private let __unknownErrorIdentity = "UnknownError"

public enum EmptyExampleError: Swift.Error, Decodable {
    case concurrency(ConcurrencyFault)
    case customerEmailAddressAlreadyExists(CustomerEmailAddressAlreadyExistsFault)
    case customerEmailAddressLimitExceeded(CustomerEmailAddressLimitExceededFault)
    case unknownResource(UnknownResourceFault)
    case validationError(reason: String)
    case unrecognizedError(String, String?)
    case unknownError

    enum CodingKeys: String, CodingKey {
        case type = "__type"
        case unrecognizedType = "__unrecognizedType"
        case errorMessage = "message"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let type = try values.decodeIfPresent(String.self, forKey: .type)
        let errorMessage = try values.decodeIfPresent(String.self, forKey: .errorMessage)
        
        guard let errorReason = type else {
            throw EmptyExampleError.unknownError
        }

        switch errorReason {
        case concurrencyIdentity:
            let errorPayload = try ConcurrencyFault(from: decoder)
            self = EmptyExampleError.concurrency(errorPayload)
        case customerEmailAddressAlreadyExistsIdentity:
            let errorPayload = try CustomerEmailAddressAlreadyExistsFault(from: decoder)
            self = EmptyExampleError.customerEmailAddressAlreadyExists(errorPayload)
        case customerEmailAddressLimitExceededIdentity:
            let errorPayload = try CustomerEmailAddressLimitExceededFault(from: decoder)
            self = EmptyExampleError.customerEmailAddressLimitExceeded(errorPayload)
        case unknownResourceIdentity:
            let errorPayload = try UnknownResourceFault(from: decoder)
            self = EmptyExampleError.unknownResource(errorPayload)
        case validationErrorIdentityBuiltIn:
            let errorMessage = try values.decodeIfPresent(String.self, forKey: .errorMessage) ?? ""
            throw SmokeOperationsError.validationError(reason: errorMessage)
        default:
            self = EmptyExampleError.unrecognizedError(errorReason, errorMessage)
        }
    }
    
}

extension EmptyExampleError: CustomStringConvertible {
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
        case .validationError:
            return __validationErrorIdentity
        case .unrecognizedError:
            return __unrecognizedErrorIdentity
        case .unknownError:
            return __unknownErrorIdentity
        }
    }
}

extension EmptyExampleError: Encodable {
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
        case .validationError(reason: let reason):
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(reason, forKey: .errorMessage)
        case .unrecognizedError(let errorReason, let errorMessage):
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(errorReason, forKey: .unrecognizedType)
            try container.encode(errorMessage, forKey: .errorMessage)
        case .unknownError:
            break
        }
    }
}

public struct EmptyExampleErrorTypes: OptionSet {
    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public static let concurrency = EmptyExampleErrorTypes(rawValue: 1)
    public static let customerEmailAddressAlreadyExists = EmptyExampleErrorTypes(rawValue: 2)
    public static let customerEmailAddressLimitExceeded = EmptyExampleErrorTypes(rawValue: 3)
    public static let unknownResource = EmptyExampleErrorTypes(rawValue: 4)
}

extension EmptyExampleErrorTypes: ErrorIdentifiableByDescription {
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
