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
// PersistenceExampleOperationsHanderSelector.swift
// PersistenceExampleOperationsHTTP1
//

import Foundation
import SmokeOperationsHTTP1
import PersistenceExampleModel
import PersistenceExampleOperations

public typealias HandlerSelectorType =
    StandardSmokeHTTP1HandlerSelector<PersistenceExampleOperationsContext, JSONPayloadHTTP1OperationDelegate>

public func createHandlerSelector() -> HandlerSelectorType {
    var newHandler = HandlerSelectorType(defaultOperationDelegate: JSONPayloadHTTP1OperationDelegate())
    
    newHandler.addHandlerForUri("/customer/{id}/email", httpMethod: .PUT,
                                operation: handleAddCustomerEmailAddress,
                                allowedErrors: [(PersistenceExampleErrorTypes.customerEmailAddressLimitExceeded, 400), (PersistenceExampleErrorTypes.customerEmailAddressAlreadyExists, 400), (PersistenceExampleErrorTypes.unknownResource, 404), (PersistenceExampleErrorTypes.concurrency, 409)])
    
    newHandler.addHandlerForUri("/customer", httpMethod: .PUT,
                                operation: handleCreateCustomerPut,
                                allowedErrors: [(PersistenceExampleErrorTypes.unknownResource, 404)])
    
    newHandler.addHandlerForUri("/customer/{id}", httpMethod: .GET,
                                operation: handleGetCustomerDetails,
                                allowedErrors: [(PersistenceExampleErrorTypes.unknownResource, 404)])
    
    newHandler.addHandlerForUri("/customer", httpMethod: .GET,
                                operation: handleListCustomersGet,
                                allowedErrors: [(PersistenceExampleErrorTypes.unknownResource, 404)])
    return newHandler
}
