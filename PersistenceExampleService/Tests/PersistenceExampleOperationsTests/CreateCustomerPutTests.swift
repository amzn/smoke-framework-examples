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
// CreateCustomerPutTests.swift
// PersistenceExampleOperationsTests
//

import XCTest
@testable import PersistenceExampleOperations
import PersistenceExampleModel
import SmokeDynamoDB

class CreateCustomerPutTests: XCTestCase {

    func testCreateCustomerPut() {
        let input = CreateCustomerRequest.__default
        let dynamodbTable = createTable()
        let operationsContext = createOperationsContext(dynamodbTable: dynamodbTable)
        
        let internalCustomerId = (PersistenceExampleOperationsContext.customerKeyPrefix + [STATIC_ID]).dynamodbKey
        let externalCustomerId = (PersistenceExampleOperationsContext.externalCustomerPrefix + [STATIC_ID]).dynamodbKey
        let expected = CreateCustomerPut200Response(xRequestID: STATIC_ID,
                                                    id: externalCustomerId)
    
        // verify the operation returns what is expected
        XCTAssertEqual(try handleCreateCustomerPut(input: input, context: operationsContext), expected)
        
        // get the customer partition from the in memory dynamodb table
        let customerPartition = dynamodbTable.store[internalCustomerId]!
        
        // get the customer identity row from the customer partition
        let customerIdentityRow = customerPartition[internalCustomerId] as! StandardTypedDatabaseItem<CustomerIdentityRow>
        let expectedCustomerEmailAddressSummary = CustomerEmailAddressSummary(emailAddresses: [], maximum: 5)
        let expectedCustomerIdentityRow = CustomerIdentityRow(customerEmailAddressSummary: expectedCustomerEmailAddressSummary,
                                                              customerID: STATIC_ID,
                                                              coreAttributes: CoreCustomerAttributes.__default,
                                                              primaryEmailAddress: nil)
        
        // verify the row inserted into the database table is as expected
        XCTAssertEqual(customerIdentityRow.rowValue, expectedCustomerIdentityRow)
    }

    static var allTests = [
        ("testCreateCustomerPut", testCreateCustomerPut),
    ]
}
