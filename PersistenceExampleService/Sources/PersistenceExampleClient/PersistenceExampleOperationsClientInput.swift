// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
// -- Generated Code; do not edit --
//
// PersistenceExampleOperationsClientInput.swift
// PersistenceExampleClient
//

import Foundation
import SmokeHTTPClient
import PersistenceExampleModel
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
        self.pathEncodable = encodable.asPersistenceExampleModelAddCustomerEmailAddressOperationInputPath()
        self.bodyEncodable = encodable.asPersistenceExampleModelAddCustomerEmailAddressOperationInputBody()
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
        self.queryEncodable = encodable.asPersistenceExampleModelGetCustomerDetailsOperationInputQuery()
        self.pathEncodable = encodable.asPersistenceExampleModelGetCustomerDetailsOperationInputPath()
        self.bodyEncodable = nil
        self.additionalHeadersEncodable = encodable.asPersistenceExampleModelGetCustomerDetailsOperationInputAdditionalHeaders()
        self.pathPostfix = nil
    }
}

/**
 Type to handle the input to the ListCustomersGet operation in a HTTP client.
 */
public typealias ListCustomersGetOperationHTTPRequestInput = QueryHTTPRequestInput
