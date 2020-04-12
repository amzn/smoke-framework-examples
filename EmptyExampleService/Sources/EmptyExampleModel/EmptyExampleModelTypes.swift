// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
// -- Generated Code; do not edit --
//
// EmptyExampleModelTypes.swift
// EmptyExampleModel
//

import Foundation
import SmokeOperations

/**
 Type definition for the AddCustomerEmailAddressRequestBodyEmailAddress field.
 */
public typealias AddCustomerEmailAddressRequestBodyEmailAddress = String

/**
 Type definition for the AddCustomerEmailAddressRequestBodyIsPrimary field.
 */
public typealias AddCustomerEmailAddressRequestBodyIsPrimary = Bool

/**
 Type definition for the AddCustomerEmailAddressRequestBodyNotifyOnAllActions field.
 */
public typealias AddCustomerEmailAddressRequestBodyNotifyOnAllActions = Bool

/**
 Type definition for the AddCustomerEmailAddressRequestBodyNotifyOnImportantAction field.
 */
public typealias AddCustomerEmailAddressRequestBodyNotifyOnImportantAction = Bool

/**
 Type definition for the AddCustomerEmailAddressRequestId field.
 */
public typealias AddCustomerEmailAddressRequestId = String

/**
 Type definition for the BirthYear field.
 */
public typealias BirthYear = Int

/**
 Type definition for the CreateCustomerPut200ResponseBodyId field.
 */
public typealias CreateCustomerPut200ResponseBodyId = String

/**
 Type definition for the CreateCustomerPutXRequestIDHeader field.
 */
public typealias CreateCustomerPutXRequestIDHeader = String

/**
 Type definition for the CustomerEmailAddress field.
 */
public typealias CustomerEmailAddress = String

/**
 Type definition for the CustomerEmailAddressAttributesList field.
 */
public typealias CustomerEmailAddressAttributesList = [CustomerEmailAddressAttributes]

public extension Array where Element: CustomerEmailAddressAttributesShape {
   func asEmptyExampleModelCustomerEmailAddressAttributesList() -> EmptyExampleModel.CustomerEmailAddressAttributesList {
       return self.map { $0.asEmptyExampleModelCustomerEmailAddressAttributes() }
   }
}

/**
 Type definition for the CustomerID field.
 */
public typealias CustomerID = String

/**
 Type definition for the CustomerIDList field.
 */
public typealias CustomerIDList = [CustomerID]

/**
 Type definition for the ErrorMessage field.
 */
public typealias ErrorMessage = String

/**
 Type definition for the FirstName field.
 */
public typealias FirstName = String

/**
 Enumeration restricting the values of the Gender field.
 */
public enum Gender: String, Codable, CustomStringConvertible {
    case female = "FEMALE"
    case male = "MALE"
    case other = "OTHER"

    public var description: String {
        return rawValue
    }
    
    public static let __default: Gender = .female
}

public extension CustomStringConvertible {
    func asEmptyExampleModelGender() throws -> EmptyExampleModel.Gender {
        let description = self.description

        guard let result = Gender(rawValue: description) else {
            throw SmokeOperationsError.validationError(reason: "Unable to convert value '"
                + description + "' to a EmptyExampleModel.Gender value.")
        }

        return result
    }
}

/**
 Type definition for the GetCustomerDetailsRequestId field.
 */
public typealias GetCustomerDetailsRequestId = String

/**
 Type definition for the GetCustomerDetailsRequestIncludeOnlyPrimaryEmail field.
 */
public typealias GetCustomerDetailsRequestIncludeOnlyPrimaryEmail = String

/**
 Type definition for the GetCustomerDetailsRequestXRequestID field.
 */
public typealias GetCustomerDetailsRequestXRequestID = String

/**
 Type definition for the LastName field.
 */
public typealias LastName = String

/**
 Type definition for the ListCustomersGetRequestMaximumPageSize field.
 */
public typealias ListCustomersGetRequestMaximumPageSize = Int

/**
 Type definition for the ListCustomersGetRequestNextPageToken field.
 */
public typealias ListCustomersGetRequestNextPageToken = String

/**
 Type definition for the NextPageToken field.
 */
public typealias NextPageToken = String

/**
 Type definition for the NotifyOnAllActions field.
 */
public typealias NotifyOnAllActions = Bool

/**
 Type definition for the NotifyOnImportantAction field.
 */
public typealias NotifyOnImportantAction = Bool

/**
 Validation for the CustomerEmailAddress field.
*/
extension EmptyExampleModel.CustomerEmailAddress {
    public func validateAsCustomerEmailAddress() throws {
        if self.count < 1 {
            throw SmokeOperationsError.validationError(reason: "The provided value to CustomerEmailAddress violated the minimum length constraint.")
        }

        if self.count > 254 {
            throw SmokeOperationsError.validationError(reason: "The provided value to CustomerEmailAddress violated the maximum length constraint.")
        }
    }
}

/**
 Validation for the CustomerID field.
*/
extension EmptyExampleModel.CustomerID {
    public func validateAsCustomerID() throws {
        if self.count < 1 {
            throw SmokeOperationsError.validationError(reason: "The provided value to CustomerID violated the minimum length constraint.")
        }

        if self.count > 150 {
            throw SmokeOperationsError.validationError(reason: "The provided value to CustomerID violated the maximum length constraint.")
        }
    }
}

/**
 Validation for the FirstName field.
*/
extension EmptyExampleModel.FirstName {
    public func validateAsFirstName() throws {
        if self.count < 1 {
            throw SmokeOperationsError.validationError(reason: "The provided value to FirstName violated the minimum length constraint.")
        }

        if self.count > 300 {
            throw SmokeOperationsError.validationError(reason: "The provided value to FirstName violated the maximum length constraint.")
        }
    }
}

/**
 Validation for the LastName field.
*/
extension EmptyExampleModel.LastName {
    public func validateAsLastName() throws {
        if self.count < 1 {
            throw SmokeOperationsError.validationError(reason: "The provided value to LastName violated the minimum length constraint.")
        }

        if self.count > 300 {
            throw SmokeOperationsError.validationError(reason: "The provided value to LastName violated the maximum length constraint.")
        }
    }
}

/**
 Validation for the NextPageToken field.
*/
extension EmptyExampleModel.NextPageToken {
    public func validateAsNextPageToken() throws {
        if self.count < 1 {
            throw SmokeOperationsError.validationError(reason: "The provided value to NextPageToken violated the minimum length constraint.")
        }

        if self.count > 2048 {
            throw SmokeOperationsError.validationError(reason: "The provided value to NextPageToken violated the maximum length constraint.")
        }
    }
}
