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
