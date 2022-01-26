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
// GetCustomerDetailsTests.swift
// PersistenceExampleOperationsTests
//

import XCTest
@testable import PersistenceExampleOperations
import PersistenceExampleModel

class GetCustomerDetailsTests: EventLoopAwareTestCase {

    func testGetCustomerDetails() async throws {
        let input = GetCustomerDetailsRequest.__default
        let operationsContext = createOperationsContext(eventLoop: self.eventLoop)
        
        _ = try await operationsContext.handleCreateCustomerPut(input: CreateCustomerRequest.__default)
    
        let response = try await operationsContext.handleGetCustomerDetails(input: input)
        XCTAssertEqual(response, CustomerAttributes.__default)
    }
    
    func testGetCustomerDetailsWithEmailAddresses() async throws {
        let input = GetCustomerDetailsRequest.__default
        let operationsContext = createOperationsContext(eventLoop: self.eventLoop)
        let externalCustomerId = (PersistenceExampleOperationsContext.externalCustomerPrefix + [TestVariables.staticId]).dynamodbKey
        
        _ = try await operationsContext.handleCreateCustomerPut(input: CreateCustomerRequest.__default)
        
        let input1 = PersistenceExampleModel.AddCustomerEmailAddressRequest(
            emailAddress: "me1@example.com",
            id: externalCustomerId,
            isPrimary: false,
            notifyOnAllActions: false,
            notifyOnImportantAction: false)
        _ = try await operationsContext.handleAddCustomerEmailAddress(input: input1)
        
        let input2 = PersistenceExampleModel.AddCustomerEmailAddressRequest(
            emailAddress: "me2@example.com",
            id: externalCustomerId,
            isPrimary: false,
            notifyOnAllActions: false,
            notifyOnImportantAction: false)
        _ = try await operationsContext.handleAddCustomerEmailAddress(input: input2)
        
        let customerEmailAddressAttributes1 = CustomerEmailAddressAttributes(
            emailAddress: "me1@example.com",
            notifyOnAllActions: false,
            notifyOnImportantAction: false)
        let customerEmailAddressAttributes2 = CustomerEmailAddressAttributes(
            emailAddress: "me2@example.com",
            notifyOnAllActions: false,
            notifyOnImportantAction: false)
        let expected = CustomerAttributes(birthYear: CreateCustomerRequest.__default.birthYear,
                                          emailAddresses: [customerEmailAddressAttributes1, customerEmailAddressAttributes2],
                                          firstName: CreateCustomerRequest.__default.firstName,
                                          gender: CreateCustomerRequest.__default.gender,
                                          lastName: CreateCustomerRequest.__default.lastName)
    
        let response = try await operationsContext.handleGetCustomerDetails(input: input)
        XCTAssertEqual(response, expected)
    }
}
