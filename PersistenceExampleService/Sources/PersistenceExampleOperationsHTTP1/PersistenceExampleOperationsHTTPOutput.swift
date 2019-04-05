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
// PersistenceExampleOperationsHTTPOutput.swift
// PersistenceExampleOperationsHTTP1
//

import Foundation
import SmokeOperationsHTTP1
import PersistenceExampleModel

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
        return asPersistenceExampleModelCreateCustomerPutOperationOutputBody()
    }
    public var additionalHeadersEncodable: CreateCustomerPutOperationOutputHeaders? {
        return asPersistenceExampleModelCreateCustomerPutOperationOutputHeaders()
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
