// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
// swiftlint:disable type_body_length function_body_length generic_type_name cyclomatic_complexity
// -- Generated Code; do not edit --
//
// EmptyExampleModelStructures.swift
// EmptyExampleModel
//

import Foundation
import SmokeOperations

/**
 Input model for the AddCustomerEmailAddress operation.
 */
public struct AddCustomerEmailAddressRequest: Codable, Validatable, Equatable, AddCustomerEmailAddressRequestShape {
    public var emailAddress: AddCustomerEmailAddressRequestBodyEmailAddress
    public var id: AddCustomerEmailAddressRequestId
    public var isPrimary: AddCustomerEmailAddressRequestBodyIsPrimary?
    public var notifyOnAllActions: AddCustomerEmailAddressRequestBodyNotifyOnAllActions
    public var notifyOnImportantAction: AddCustomerEmailAddressRequestBodyNotifyOnImportantAction

    public init(emailAddress: AddCustomerEmailAddressRequestBodyEmailAddress,
                id: AddCustomerEmailAddressRequestId,
                isPrimary: AddCustomerEmailAddressRequestBodyIsPrimary? = nil,
                notifyOnAllActions: AddCustomerEmailAddressRequestBodyNotifyOnAllActions,
                notifyOnImportantAction: AddCustomerEmailAddressRequestBodyNotifyOnImportantAction) {
        self.emailAddress = emailAddress
        self.id = id
        self.isPrimary = isPrimary
        self.notifyOnAllActions = notifyOnAllActions
        self.notifyOnImportantAction = notifyOnImportantAction
    }

    enum CodingKeys: String, CodingKey {
        case emailAddress
        case id
        case isPrimary
        case notifyOnAllActions
        case notifyOnImportantAction
    }

    public func validate() throws {
    }
}

public protocol AddCustomerEmailAddressRequestShape {
    var emailAddress: String { get }
    var id: String { get }
    var isPrimary: Bool? { get }
    var notifyOnAllActions: Bool { get }
    var notifyOnImportantAction: Bool { get }

    func asEmptyExampleModelAddCustomerEmailAddressRequest() -> EmptyExampleModel.AddCustomerEmailAddressRequest
}

public extension AddCustomerEmailAddressRequestShape {

    func asEmptyExampleModelAddCustomerEmailAddressRequest() -> EmptyExampleModel.AddCustomerEmailAddressRequest {
        if let modelInstance = self as? AddCustomerEmailAddressRequest {
            // don't need to convert, already can be serialized
            return modelInstance
        } else {
            return AddCustomerEmailAddressRequest(emailAddress: emailAddress,
                id: id,
                isPrimary: isPrimary,
                notifyOnAllActions: notifyOnAllActions,
                notifyOnImportantAction: notifyOnImportantAction)
        }
    }
}

public struct AddCustomerEmailAddressRequestBody: Codable, Validatable, Equatable, AddCustomerEmailAddressRequestBodyShape {
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

public protocol AddCustomerEmailAddressRequestBodyShape {
    var emailAddress: String { get }
    var isPrimary: Bool? { get }
    var notifyOnAllActions: Bool { get }
    var notifyOnImportantAction: Bool { get }

    func asEmptyExampleModelAddCustomerEmailAddressRequestBody() -> EmptyExampleModel.AddCustomerEmailAddressRequestBody
}

public extension AddCustomerEmailAddressRequestBodyShape {

    func asEmptyExampleModelAddCustomerEmailAddressRequestBody() -> EmptyExampleModel.AddCustomerEmailAddressRequestBody {
        if let modelInstance = self as? AddCustomerEmailAddressRequestBody {
            // don't need to convert, already can be serialized
            return modelInstance
        } else {
            return AddCustomerEmailAddressRequestBody(emailAddress: emailAddress,
                isPrimary: isPrimary,
                notifyOnAllActions: notifyOnAllActions,
                notifyOnImportantAction: notifyOnImportantAction)
        }
    }
}

public struct ConcurrencyFault: Codable, Validatable, Equatable, ConcurrencyFaultShape {
    public var message: ErrorMessage?

    public init(message: ErrorMessage? = nil) {
        self.message = message
    }

    enum CodingKeys: String, CodingKey {
        case message
    }

    public func validate() throws {
    }
}

public protocol ConcurrencyFaultShape {
    var message: String? { get }

    func asEmptyExampleModelConcurrencyFault() -> EmptyExampleModel.ConcurrencyFault
}

public extension ConcurrencyFaultShape {

    func asEmptyExampleModelConcurrencyFault() -> EmptyExampleModel.ConcurrencyFault {
        if let modelInstance = self as? ConcurrencyFault {
            // don't need to convert, already can be serialized
            return modelInstance
        } else {
            return ConcurrencyFault(message: message)
        }
    }
}

public struct CoreCustomerAttributes: Codable, Validatable, Equatable, CoreCustomerAttributesShape {
    public var birthYear: BirthYear
    public var firstName: FirstName
    public var gender: Gender?
    public var lastName: LastName

    public init(birthYear: BirthYear,
                firstName: FirstName,
                gender: Gender? = nil,
                lastName: LastName) {
        self.birthYear = birthYear
        self.firstName = firstName
        self.gender = gender
        self.lastName = lastName
    }

    enum CodingKeys: String, CodingKey {
        case birthYear
        case firstName
        case gender
        case lastName
    }

    public func validate() throws {
        try firstName.validateAsFirstName()
        try lastName.validateAsLastName()
    }
}

public protocol CoreCustomerAttributesShape {
    associatedtype GenderType: CustomStringConvertible

    var birthYear: Int { get }
    var firstName: String { get }
    var gender: GenderType? { get }
    var lastName: String { get }

    func asEmptyExampleModelCoreCustomerAttributes() throws -> EmptyExampleModel.CoreCustomerAttributes
}

public extension CoreCustomerAttributesShape {

    func asEmptyExampleModelCoreCustomerAttributes() throws -> EmptyExampleModel.CoreCustomerAttributes {
        if let modelInstance = self as? CoreCustomerAttributes {
            // don't need to convert, already can be serialized
            return modelInstance
        } else {
            let convertedGender: EmptyExampleModel.Gender?
            if let description = gender?.description {
                if let newGender = EmptyExampleModel.Gender(rawValue: description) {
                    convertedGender = newGender
                } else {
                    throw SmokeOperationsError.validationError(reason: "Unable to convert value '"
                        + description + "' of field 'gender' to a EmptyExampleModel.Gender value.")
                }
            } else {
                convertedGender = nil
            }
            return CoreCustomerAttributes(birthYear: birthYear,
                firstName: firstName,
                gender: convertedGender,
                lastName: lastName)
        }
    }
}

/**
 Output model for the CreateCustomerPut operation.
 */
public struct CreateCustomerPut200Response: Codable, Validatable, Equatable, CreateCustomerPut200ResponseShape {
    public var xRequestID: CreateCustomerPutXRequestIDHeader?
    public var id: CreateCustomerPut200ResponseBodyId?

    public init(xRequestID: CreateCustomerPutXRequestIDHeader? = nil,
                id: CreateCustomerPut200ResponseBodyId? = nil) {
        self.xRequestID = xRequestID
        self.id = id
    }

    enum CodingKeys: String, CodingKey {
        case xRequestID = "X-Request-ID"
        case id
    }

    public func validate() throws {
    }
}

public protocol CreateCustomerPut200ResponseShape {
    var xRequestID: String? { get }
    var id: String? { get }

    func asEmptyExampleModelCreateCustomerPut200Response() -> EmptyExampleModel.CreateCustomerPut200Response
}

public extension CreateCustomerPut200ResponseShape {

    func asEmptyExampleModelCreateCustomerPut200Response() -> EmptyExampleModel.CreateCustomerPut200Response {
        if let modelInstance = self as? CreateCustomerPut200Response {
            // don't need to convert, already can be serialized
            return modelInstance
        } else {
            return CreateCustomerPut200Response(xRequestID: xRequestID,
                id: id)
        }
    }
}

public struct CreateCustomerPut200ResponseBody: Codable, Validatable, Equatable, CreateCustomerPut200ResponseBodyShape {
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

public protocol CreateCustomerPut200ResponseBodyShape {
    var id: String? { get }

    func asEmptyExampleModelCreateCustomerPut200ResponseBody() -> EmptyExampleModel.CreateCustomerPut200ResponseBody
}

public extension CreateCustomerPut200ResponseBodyShape {

    func asEmptyExampleModelCreateCustomerPut200ResponseBody() -> EmptyExampleModel.CreateCustomerPut200ResponseBody {
        if let modelInstance = self as? CreateCustomerPut200ResponseBody {
            // don't need to convert, already can be serialized
            return modelInstance
        } else {
            return CreateCustomerPut200ResponseBody(id: id)
        }
    }
}

public struct CreateCustomerRequest: Codable, Validatable, Equatable, CreateCustomerRequestShape {
    public var birthYear: BirthYear
    public var firstName: FirstName
    public var gender: Gender?
    public var lastName: LastName

    public init(birthYear: BirthYear,
                firstName: FirstName,
                gender: Gender? = nil,
                lastName: LastName) {
        self.birthYear = birthYear
        self.firstName = firstName
        self.gender = gender
        self.lastName = lastName
    }

    enum CodingKeys: String, CodingKey {
        case birthYear
        case firstName
        case gender
        case lastName
    }

    public func validate() throws {
        try firstName.validateAsFirstName()
        try lastName.validateAsLastName()
    }
}

public protocol CreateCustomerRequestShape {
    associatedtype GenderType: CustomStringConvertible

    var birthYear: Int { get }
    var firstName: String { get }
    var gender: GenderType? { get }
    var lastName: String { get }

    func asEmptyExampleModelCreateCustomerRequest() throws -> EmptyExampleModel.CreateCustomerRequest
}

public extension CreateCustomerRequestShape {

    func asEmptyExampleModelCreateCustomerRequest() throws -> EmptyExampleModel.CreateCustomerRequest {
        if let modelInstance = self as? CreateCustomerRequest {
            // don't need to convert, already can be serialized
            return modelInstance
        } else {
            let convertedGender: EmptyExampleModel.Gender?
            if let description = gender?.description {
                if let newGender = EmptyExampleModel.Gender(rawValue: description) {
                    convertedGender = newGender
                } else {
                    throw SmokeOperationsError.validationError(reason: "Unable to convert value '"
                        + description + "' of field 'gender' to a EmptyExampleModel.Gender value.")
                }
            } else {
                convertedGender = nil
            }
            return CreateCustomerRequest(birthYear: birthYear,
                firstName: firstName,
                gender: convertedGender,
                lastName: lastName)
        }
    }
}

public struct CustomerAttributes: Codable, Validatable, Equatable, CustomerAttributesShape {
    public var birthYear: BirthYear
    public var emailAddresses: CustomerEmailAddressAttributesList
    public var firstName: FirstName
    public var gender: Gender?
    public var lastName: LastName

    public init(birthYear: BirthYear,
                emailAddresses: CustomerEmailAddressAttributesList,
                firstName: FirstName,
                gender: Gender? = nil,
                lastName: LastName) {
        self.birthYear = birthYear
        self.emailAddresses = emailAddresses
        self.firstName = firstName
        self.gender = gender
        self.lastName = lastName
    }

    enum CodingKeys: String, CodingKey {
        case birthYear
        case emailAddresses
        case firstName
        case gender
        case lastName
    }

    public func validate() throws {
        try firstName.validateAsFirstName()
        try lastName.validateAsLastName()
    }
}

public protocol CustomerAttributesShape {
    associatedtype CustomerEmailAddressAttributesType: CustomerEmailAddressAttributesShape
    associatedtype GenderType: CustomStringConvertible

    var birthYear: Int { get }
    var emailAddresses: [CustomerEmailAddressAttributesType] { get }
    var firstName: String { get }
    var gender: GenderType? { get }
    var lastName: String { get }

    func asEmptyExampleModelCustomerAttributes() throws -> EmptyExampleModel.CustomerAttributes
}

public extension CustomerAttributesShape {

    func asEmptyExampleModelCustomerAttributes() throws -> EmptyExampleModel.CustomerAttributes {
        if let modelInstance = self as? CustomerAttributes {
            // don't need to convert, already can be serialized
            return modelInstance
        } else {
            let convertedEmailAddresses: [EmptyExampleModel.CustomerEmailAddressAttributes] = emailAddresses.map { entry in
                return entry.asEmptyExampleModelCustomerEmailAddressAttributes()
            }
            let convertedGender: EmptyExampleModel.Gender?
            if let description = gender?.description {
                if let newGender = EmptyExampleModel.Gender(rawValue: description) {
                    convertedGender = newGender
                } else {
                    throw SmokeOperationsError.validationError(reason: "Unable to convert value '"
                        + description + "' of field 'gender' to a EmptyExampleModel.Gender value.")
                }
            } else {
                convertedGender = nil
            }
            return CustomerAttributes(birthYear: birthYear,
                emailAddresses: convertedEmailAddresses,
                firstName: firstName,
                gender: convertedGender,
                lastName: lastName)
        }
    }
}

public struct CustomerEmailAddressAlreadyExistsFault: Codable, Validatable, Equatable, CustomerEmailAddressAlreadyExistsFaultShape {
    public var message: ErrorMessage?

    public init(message: ErrorMessage? = nil) {
        self.message = message
    }

    enum CodingKeys: String, CodingKey {
        case message
    }

    public func validate() throws {
    }
}

public protocol CustomerEmailAddressAlreadyExistsFaultShape {
    var message: String? { get }

    func asEmptyExampleModelCustomerEmailAddressAlreadyExistsFault() -> EmptyExampleModel.CustomerEmailAddressAlreadyExistsFault
}

public extension CustomerEmailAddressAlreadyExistsFaultShape {

    func asEmptyExampleModelCustomerEmailAddressAlreadyExistsFault() -> EmptyExampleModel.CustomerEmailAddressAlreadyExistsFault {
        if let modelInstance = self as? CustomerEmailAddressAlreadyExistsFault {
            // don't need to convert, already can be serialized
            return modelInstance
        } else {
            return CustomerEmailAddressAlreadyExistsFault(message: message)
        }
    }
}

public struct CustomerEmailAddressAttributes: Codable, Validatable, Equatable, CustomerEmailAddressAttributesShape {
    public var emailAddress: CustomerEmailAddress
    public var notifyOnAllActions: NotifyOnAllActions
    public var notifyOnImportantAction: NotifyOnImportantAction

    public init(emailAddress: CustomerEmailAddress,
                notifyOnAllActions: NotifyOnAllActions,
                notifyOnImportantAction: NotifyOnImportantAction) {
        self.emailAddress = emailAddress
        self.notifyOnAllActions = notifyOnAllActions
        self.notifyOnImportantAction = notifyOnImportantAction
    }

    enum CodingKeys: String, CodingKey {
        case emailAddress
        case notifyOnAllActions
        case notifyOnImportantAction
    }

    public func validate() throws {
        try emailAddress.validateAsCustomerEmailAddress()
    }
}

public protocol CustomerEmailAddressAttributesShape {
    var emailAddress: String { get }
    var notifyOnAllActions: Bool { get }
    var notifyOnImportantAction: Bool { get }

    func asEmptyExampleModelCustomerEmailAddressAttributes() -> EmptyExampleModel.CustomerEmailAddressAttributes
}

public extension CustomerEmailAddressAttributesShape {

    func asEmptyExampleModelCustomerEmailAddressAttributes() -> EmptyExampleModel.CustomerEmailAddressAttributes {
        if let modelInstance = self as? CustomerEmailAddressAttributes {
            // don't need to convert, already can be serialized
            return modelInstance
        } else {
            return CustomerEmailAddressAttributes(emailAddress: emailAddress,
                notifyOnAllActions: notifyOnAllActions,
                notifyOnImportantAction: notifyOnImportantAction)
        }
    }
}

public struct CustomerEmailAddressIdentity: Codable, Validatable, Equatable, CustomerEmailAddressIdentityShape {
    public var id: CustomerEmailAddress

    public init(id: CustomerEmailAddress) {
        self.id = id
    }

    enum CodingKeys: String, CodingKey {
        case id
    }

    public func validate() throws {
        try id.validateAsCustomerEmailAddress()
    }
}

public protocol CustomerEmailAddressIdentityShape {
    var id: String { get }

    func asEmptyExampleModelCustomerEmailAddressIdentity() -> EmptyExampleModel.CustomerEmailAddressIdentity
}

public extension CustomerEmailAddressIdentityShape {

    func asEmptyExampleModelCustomerEmailAddressIdentity() -> EmptyExampleModel.CustomerEmailAddressIdentity {
        if let modelInstance = self as? CustomerEmailAddressIdentity {
            // don't need to convert, already can be serialized
            return modelInstance
        } else {
            return CustomerEmailAddressIdentity(id: id)
        }
    }
}

public struct CustomerEmailAddressLimitExceededFault: Codable, Validatable, Equatable, CustomerEmailAddressLimitExceededFaultShape {
    public var message: ErrorMessage?

    public init(message: ErrorMessage? = nil) {
        self.message = message
    }

    enum CodingKeys: String, CodingKey {
        case message
    }

    public func validate() throws {
    }
}

public protocol CustomerEmailAddressLimitExceededFaultShape {
    var message: String? { get }

    func asEmptyExampleModelCustomerEmailAddressLimitExceededFault() -> EmptyExampleModel.CustomerEmailAddressLimitExceededFault
}

public extension CustomerEmailAddressLimitExceededFaultShape {

    func asEmptyExampleModelCustomerEmailAddressLimitExceededFault() -> EmptyExampleModel.CustomerEmailAddressLimitExceededFault {
        if let modelInstance = self as? CustomerEmailAddressLimitExceededFault {
            // don't need to convert, already can be serialized
            return modelInstance
        } else {
            return CustomerEmailAddressLimitExceededFault(message: message)
        }
    }
}

public struct CustomerIdentity: Codable, Validatable, Equatable, CustomerIdentityShape {
    public var id: CustomerID

    public init(id: CustomerID) {
        self.id = id
    }

    enum CodingKeys: String, CodingKey {
        case id
    }

    public func validate() throws {
        try id.validateAsCustomerID()
    }
}

public protocol CustomerIdentityShape {
    var id: String { get }

    func asEmptyExampleModelCustomerIdentity() -> EmptyExampleModel.CustomerIdentity
}

public extension CustomerIdentityShape {

    func asEmptyExampleModelCustomerIdentity() -> EmptyExampleModel.CustomerIdentity {
        if let modelInstance = self as? CustomerIdentity {
            // don't need to convert, already can be serialized
            return modelInstance
        } else {
            return CustomerIdentity(id: id)
        }
    }
}

/**
 Input model for the GetCustomerDetails operation.
 */
public struct GetCustomerDetailsRequest: Codable, Validatable, Equatable, GetCustomerDetailsRequestShape {
    public var xRequestID: GetCustomerDetailsRequestXRequestID?
    public var id: GetCustomerDetailsRequestId
    public var includeOnlyPrimaryEmail: GetCustomerDetailsRequestIncludeOnlyPrimaryEmail?

    public init(xRequestID: GetCustomerDetailsRequestXRequestID? = nil,
                id: GetCustomerDetailsRequestId,
                includeOnlyPrimaryEmail: GetCustomerDetailsRequestIncludeOnlyPrimaryEmail? = nil) {
        self.xRequestID = xRequestID
        self.id = id
        self.includeOnlyPrimaryEmail = includeOnlyPrimaryEmail
    }

    enum CodingKeys: String, CodingKey {
        case xRequestID = "X-Request-ID"
        case id
        case includeOnlyPrimaryEmail
    }

    public func validate() throws {
    }
}

public protocol GetCustomerDetailsRequestShape {
    var xRequestID: String? { get }
    var id: String { get }
    var includeOnlyPrimaryEmail: String? { get }

    func asEmptyExampleModelGetCustomerDetailsRequest() -> EmptyExampleModel.GetCustomerDetailsRequest
}

public extension GetCustomerDetailsRequestShape {

    func asEmptyExampleModelGetCustomerDetailsRequest() -> EmptyExampleModel.GetCustomerDetailsRequest {
        if let modelInstance = self as? GetCustomerDetailsRequest {
            // don't need to convert, already can be serialized
            return modelInstance
        } else {
            return GetCustomerDetailsRequest(xRequestID: xRequestID,
                id: id,
                includeOnlyPrimaryEmail: includeOnlyPrimaryEmail)
        }
    }
}

/**
 Input model for the ListCustomersGet operation.
 */
public struct ListCustomersGetRequest: Codable, Validatable, Equatable, ListCustomersGetRequestShape {
    public var maximumPageSize: ListCustomersGetRequestMaximumPageSize?
    public var nextPageToken: ListCustomersGetRequestNextPageToken?

    public init(maximumPageSize: ListCustomersGetRequestMaximumPageSize? = nil,
                nextPageToken: ListCustomersGetRequestNextPageToken? = nil) {
        self.maximumPageSize = maximumPageSize
        self.nextPageToken = nextPageToken
    }

    enum CodingKeys: String, CodingKey {
        case maximumPageSize
        case nextPageToken
    }

    public func validate() throws {
    }
}

public protocol ListCustomersGetRequestShape {
    var maximumPageSize: Int? { get }
    var nextPageToken: String? { get }

    func asEmptyExampleModelListCustomersGetRequest() -> EmptyExampleModel.ListCustomersGetRequest
}

public extension ListCustomersGetRequestShape {

    func asEmptyExampleModelListCustomersGetRequest() -> EmptyExampleModel.ListCustomersGetRequest {
        if let modelInstance = self as? ListCustomersGetRequest {
            // don't need to convert, already can be serialized
            return modelInstance
        } else {
            return ListCustomersGetRequest(maximumPageSize: maximumPageSize,
                nextPageToken: nextPageToken)
        }
    }
}

public struct ListCustomersResponse: Codable, Validatable, Equatable, ListCustomersResponseShape {
    public var customerIDs: CustomerIDList
    public var nextPageToken: NextPageToken?

    public init(customerIDs: CustomerIDList,
                nextPageToken: NextPageToken? = nil) {
        self.customerIDs = customerIDs
        self.nextPageToken = nextPageToken
    }

    enum CodingKeys: String, CodingKey {
        case customerIDs
        case nextPageToken
    }

    public func validate() throws {
        try nextPageToken?.validateAsNextPageToken()
    }
}

public protocol ListCustomersResponseShape {
    var customerIDs: [String] { get }
    var nextPageToken: String? { get }

    func asEmptyExampleModelListCustomersResponse() -> EmptyExampleModel.ListCustomersResponse
}

public extension ListCustomersResponseShape {

    func asEmptyExampleModelListCustomersResponse() -> EmptyExampleModel.ListCustomersResponse {
        if let modelInstance = self as? ListCustomersResponse {
            // don't need to convert, already can be serialized
            return modelInstance
        } else {
            let convertedCustomerIDs = customerIDs
            return ListCustomersResponse(customerIDs: convertedCustomerIDs,
                nextPageToken: nextPageToken)
        }
    }
}

public struct UnknownResourceFault: Codable, Validatable, Equatable, UnknownResourceFaultShape {
    public var message: ErrorMessage?

    public init(message: ErrorMessage? = nil) {
        self.message = message
    }

    enum CodingKeys: String, CodingKey {
        case message
    }

    public func validate() throws {
    }
}

public protocol UnknownResourceFaultShape {
    var message: String? { get }

    func asEmptyExampleModelUnknownResourceFault() -> EmptyExampleModel.UnknownResourceFault
}

public extension UnknownResourceFaultShape {

    func asEmptyExampleModelUnknownResourceFault() -> EmptyExampleModel.UnknownResourceFault {
        if let modelInstance = self as? UnknownResourceFault {
            // don't need to convert, already can be serialized
            return modelInstance
        } else {
            return UnknownResourceFault(message: message)
        }
    }
}
