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
// PersistenceExampleModelDefaultInstances.swift
// PersistenceExampleModel
//

import Foundation

private struct DefaultValues {
    static let birthYear = 1985
    static let emailAddress = "me@example.com"
    static let firstName = "John"
    static let id = "com.mycompany.pe.customer.53E2BFA1-E55C-42FE-8110-77A68C069EF4"
    static let lastName = "Smith"
}

public extension AddCustomerEmailAddressRequest {
    /**
     Default instance of the AddCustomerEmailAddressRequest structure.
     */
    static let __default: PersistenceExampleModel.AddCustomerEmailAddressRequest = {
        let defaultInstance = PersistenceExampleModel.AddCustomerEmailAddressRequest(
            emailAddress: DefaultValues.emailAddress,
            id: DefaultValues.id,
            isPrimary: nil,
            notifyOnAllActions: false,
            notifyOnImportantAction: false)

        return defaultInstance
    }()
}

public extension AddCustomerEmailAddressRequestBody {
    /**
     Default instance of the AddCustomerEmailAddressRequestBody structure.
     */
    static let __default: PersistenceExampleModel.AddCustomerEmailAddressRequestBody = {
        let defaultInstance = PersistenceExampleModel.AddCustomerEmailAddressRequestBody(
            emailAddress: DefaultValues.emailAddress,
            isPrimary: nil,
            notifyOnAllActions: false,
            notifyOnImportantAction: false)

        return defaultInstance
    }()
}

public extension ConcurrencyFault {
    /**
     Default instance of the ConcurrencyFault structure.
     */
    static let __default: PersistenceExampleModel.ConcurrencyFault = {
        let defaultInstance = PersistenceExampleModel.ConcurrencyFault(
            message: nil)

        return defaultInstance
    }()
}

public extension CoreCustomerAttributes {
    /**
     Default instance of the CoreCustomerAttributes structure.
     */
    static let __default: PersistenceExampleModel.CoreCustomerAttributes = {
        let defaultInstance = PersistenceExampleModel.CoreCustomerAttributes(
            birthYear: DefaultValues.birthYear,
            firstName: DefaultValues.firstName,
            gender: nil,
            lastName: DefaultValues.lastName)

        return defaultInstance
    }()
}

public extension CreateCustomerPut200Response {
    /**
     Default instance of the CreateCustomerPut200Response structure.
     */
    static let __default: PersistenceExampleModel.CreateCustomerPut200Response = {
        let defaultInstance = PersistenceExampleModel.CreateCustomerPut200Response(
            xRequestID: nil,
            id: nil)

        return defaultInstance
    }()
}

public extension CreateCustomerPut200ResponseBody {
    /**
     Default instance of the CreateCustomerPut200ResponseBody structure.
     */
    static let __default: PersistenceExampleModel.CreateCustomerPut200ResponseBody = {
        let defaultInstance = PersistenceExampleModel.CreateCustomerPut200ResponseBody(
            id: nil)

        return defaultInstance
    }()
}

public extension CreateCustomerRequest {
    /**
     Default instance of the CreateCustomerRequest structure.
     */
    static let __default: PersistenceExampleModel.CreateCustomerRequest = {
        let defaultInstance = PersistenceExampleModel.CreateCustomerRequest(
            birthYear: DefaultValues.birthYear,
            firstName: DefaultValues.firstName,
            gender: nil,
            lastName: DefaultValues.lastName)

        return defaultInstance
    }()
}

public extension CustomerAttributes {
    /**
     Default instance of the CustomerAttributes structure.
     */
    static let __default: PersistenceExampleModel.CustomerAttributes = {
        let defaultInstance = PersistenceExampleModel.CustomerAttributes(
            birthYear: DefaultValues.birthYear,
            emailAddresses: [],
            firstName: DefaultValues.firstName,
            gender: nil,
            lastName: DefaultValues.lastName)

        return defaultInstance
    }()
}

public extension CustomerEmailAddressAlreadyExistsFault {
    /**
     Default instance of the CustomerEmailAddressAlreadyExistsFault structure.
     */
    static let __default: PersistenceExampleModel.CustomerEmailAddressAlreadyExistsFault = {
        let defaultInstance = PersistenceExampleModel.CustomerEmailAddressAlreadyExistsFault(
            message: nil)

        return defaultInstance
    }()
}

public extension CustomerEmailAddressAttributes {
    /**
     Default instance of the CustomerEmailAddressAttributes structure.
     */
    static let __default: PersistenceExampleModel.CustomerEmailAddressAttributes = {
        let defaultInstance = PersistenceExampleModel.CustomerEmailAddressAttributes(
            emailAddress: DefaultValues.emailAddress,
            notifyOnAllActions: false,
            notifyOnImportantAction: false)

        return defaultInstance
    }()
}

public extension CustomerEmailAddressIdentity {
    /**
     Default instance of the CustomerEmailAddressIdentity structure.
     */
    static let __default: PersistenceExampleModel.CustomerEmailAddressIdentity = {
        let defaultInstance = PersistenceExampleModel.CustomerEmailAddressIdentity(
            id: DefaultValues.id)

        return defaultInstance
    }()
}

public extension CustomerEmailAddressLimitExceededFault {
    /**
     Default instance of the CustomerEmailAddressLimitExceededFault structure.
     */
    static let __default: PersistenceExampleModel.CustomerEmailAddressLimitExceededFault = {
        let defaultInstance = PersistenceExampleModel.CustomerEmailAddressLimitExceededFault(
            message: nil)

        return defaultInstance
    }()
}

public extension CustomerIdentity {
    /**
     Default instance of the CustomerIdentity structure.
     */
    static let __default: PersistenceExampleModel.CustomerIdentity = {
        let defaultInstance = PersistenceExampleModel.CustomerIdentity(
            id: DefaultValues.id)

        return defaultInstance
    }()
}

public extension GetCustomerDetailsRequest {
    /**
     Default instance of the GetCustomerDetailsRequest structure.
     */
    static let __default: PersistenceExampleModel.GetCustomerDetailsRequest = {
        let defaultInstance = PersistenceExampleModel.GetCustomerDetailsRequest(
            xRequestID: nil,
            id: DefaultValues.id,
            includeOnlyPrimaryEmail: nil)

        return defaultInstance
    }()
}

public extension ListCustomersGetRequest {
    /**
     Default instance of the ListCustomersGetRequest structure.
     */
    static let __default: PersistenceExampleModel.ListCustomersGetRequest = {
        let defaultInstance = PersistenceExampleModel.ListCustomersGetRequest(
            maximumPageSize: nil,
            nextPageToken: nil)

        return defaultInstance
    }()
}

public extension ListCustomersResponse {
    /**
     Default instance of the ListCustomersResponse structure.
     */
    static let __default: PersistenceExampleModel.ListCustomersResponse = {
        let defaultInstance = PersistenceExampleModel.ListCustomersResponse(
            customerIDs: [],
            nextPageToken: nil)

        return defaultInstance
    }()
}

public extension UnknownResourceFault {
    /**
     Default instance of the UnknownResourceFault structure.
     */
    static let __default: PersistenceExampleModel.UnknownResourceFault = {
        let defaultInstance = PersistenceExampleModel.UnknownResourceFault(
            message: nil)

        return defaultInstance
    }()
}
