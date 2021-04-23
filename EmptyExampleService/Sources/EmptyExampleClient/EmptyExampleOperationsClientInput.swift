// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
// swiftlint:disable type_body_length function_body_length generic_type_name cyclomatic_complexity
// -- Generated Code; do not edit --
//
// EmptyExampleOperationsClientInput.swift
// EmptyExampleClient
//

import Foundation
import SmokeHTTPClient
import EmptyExampleModel
import SmokeOperations

/**
 Type to handle the input to the AddCustomerEmailAddress operation in a HTTP client.
 */
public struct AddCustomerEmailAddressOperationHTTPRequestInput: HTTPRequestInputProtocol {
    public let queryEncodable: String?
    public let pathEncodable: AddCustomerEmailAddressOperationInputPath?
    public let bodyEncodable: AddCustomerEmailAddressOperationInputBody?
    public let additionalHeadersEncodable: String?
    public let pathPostfix: String?

    public init(encodable: AddCustomerEmailAddressRequest) {
        self.queryEncodable = nil
        self.pathEncodable = encodable.asEmptyExampleModelAddCustomerEmailAddressOperationInputPath()
        self.bodyEncodable = encodable.asEmptyExampleModelAddCustomerEmailAddressOperationInputBody()
        self.additionalHeadersEncodable = nil
        self.pathPostfix = nil
    }
}

/**
 Type to handle the input to the CreateCustomerPut operation in a HTTP client.
 */
public typealias CreateCustomerPutOperationHTTPRequestInput = BodyHTTPRequestInput

/**
 Type to handle the input to the GetCustomerDetails operation in a HTTP client.
 */
public struct GetCustomerDetailsOperationHTTPRequestInput: HTTPRequestInputProtocol {
    public let queryEncodable: GetCustomerDetailsOperationInputQuery?
    public let pathEncodable: GetCustomerDetailsOperationInputPath?
    public let bodyEncodable: String?
    public let additionalHeadersEncodable: GetCustomerDetailsOperationInputAdditionalHeaders?
    public let pathPostfix: String?

    public init(encodable: GetCustomerDetailsRequest) {
        self.queryEncodable = encodable.asEmptyExampleModelGetCustomerDetailsOperationInputQuery()
        self.pathEncodable = encodable.asEmptyExampleModelGetCustomerDetailsOperationInputPath()
        self.bodyEncodable = nil
        self.additionalHeadersEncodable = encodable.asEmptyExampleModelGetCustomerDetailsOperationInputAdditionalHeaders()
        self.pathPostfix = nil
    }
}

/**
 Type to handle the input to the ListCustomersGet operation in a HTTP client.
 */
public typealias ListCustomersGetOperationHTTPRequestInput = QueryHTTPRequestInput
