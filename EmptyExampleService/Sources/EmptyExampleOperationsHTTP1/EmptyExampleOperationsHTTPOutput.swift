// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
// -- Generated Code; do not edit --
//
// EmptyExampleOperationsHTTPOutput.swift
// EmptyExampleOperationsHTTP1
//

import Foundation
import SmokeOperationsHTTP1
import EmptyExampleModel

import SmokeOperations
/**
 Type to handle the http output to the AddCustomerEmailAddress operation.
 */
extension CustomerEmailAddressIdentity: OperationHTTP1OutputProtocol {
    public var bodyEncodable: CustomerEmailAddressIdentity? {
        return self
    }
    public var additionalHeadersEncodable: String? {
        return nil
    }
}
/**
 Type to handle the http output to the CreateCustomerPut operation.
 */
extension CreateCustomerPut200Response: OperationHTTP1OutputProtocol {
    public var bodyEncodable: CreateCustomerPutOperationOutputBody? {
        return asEmptyExampleModelCreateCustomerPutOperationOutputBody()
    }
    public var additionalHeadersEncodable: CreateCustomerPutOperationOutputHeaders? {
        return asEmptyExampleModelCreateCustomerPutOperationOutputHeaders()
    }
}
/**
 Type to handle the http output to the GetCustomerDetails operation.
 */
extension CustomerAttributes: OperationHTTP1OutputProtocol {
    public var bodyEncodable: CustomerAttributes? {
        return self
    }
    public var additionalHeadersEncodable: String? {
        return nil
    }
}
/**
 Type to handle the http output to the ListCustomersGet operation.
 */
extension ListCustomersResponse: OperationHTTP1OutputProtocol {
    public var bodyEncodable: ListCustomersResponse? {
        return self
    }
    public var additionalHeadersEncodable: String? {
        return nil
    }
}
