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
// PersistenceExampleOperationsClientOutput.swift
// PersistenceExampleClient
//

import Foundation
import SmokeHTTPClient
import PersistenceExampleModel
import SmokeOperations

/**
 Type to handle the output from the AddCustomerEmailAddress operation in a HTTP client.
 */
extension CustomerEmailAddressIdentity: HTTPResponseOutputProtocol {
    public typealias BodyType = CustomerEmailAddressIdentity
    public typealias HeadersType = CustomerEmailAddressIdentity

    public static func compose(bodyDecodableProvider: () throws -> BodyType,
                               headersDecodableProvider: () throws -> HeadersType) throws -> CustomerEmailAddressIdentity {
        return try bodyDecodableProvider()
    }
}

/**
 Type to handle the output from the CreateCustomerPut operation in a HTTP client.
 */
extension CreateCustomerPut200Response: HTTPResponseOutputProtocol {
    public typealias BodyType = CreateCustomerPutOperationOutputBody
    public typealias HeadersType = CreateCustomerPutOperationOutputHeaders

    public static func compose(bodyDecodableProvider: () throws -> BodyType,
                               headersDecodableProvider: () throws -> HeadersType) throws -> CreateCustomerPut200Response {
        let body = try bodyDecodableProvider()
        let headers = try headersDecodableProvider()

        return PersistenceExampleModel.CreateCustomerPut200Response(
            xRequestID: headers.xRequestID,
            id: body.id)
    }
}

/**
 Type to handle the output from the GetCustomerDetails operation in a HTTP client.
 */
extension CustomerAttributes: HTTPResponseOutputProtocol {
    public typealias BodyType = CustomerAttributes
    public typealias HeadersType = CustomerAttributes

    public static func compose(bodyDecodableProvider: () throws -> BodyType,
                               headersDecodableProvider: () throws -> HeadersType) throws -> CustomerAttributes {
        return try bodyDecodableProvider()
    }
}

/**
 Type to handle the output from the ListCustomersGet operation in a HTTP client.
 */
extension ListCustomersResponse: HTTPResponseOutputProtocol {
    public typealias BodyType = ListCustomersResponse
    public typealias HeadersType = ListCustomersResponse

    public static func compose(bodyDecodableProvider: () throws -> BodyType,
                               headersDecodableProvider: () throws -> HeadersType) throws -> ListCustomersResponse {
        return try bodyDecodableProvider()
    }
}
