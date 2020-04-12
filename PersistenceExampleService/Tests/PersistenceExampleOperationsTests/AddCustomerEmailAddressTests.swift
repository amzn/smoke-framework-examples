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
// AddCustomerEmailAddressTests.swift
// PersistenceExampleOperationsTests
//

import XCTest
@testable import PersistenceExampleOperations
import PersistenceExampleModel
import SmokeDynamoDB

class AddCustomerEmailAddressTests: XCTestCase {

    func testAddCustomerEmailAddress() throws {
        let input = AddCustomerEmailAddressRequest.__default
        let operationsContext = createOperationsContext()
        
        _ = try handleCreateCustomerPut(input: CreateCustomerRequest.__default, context: operationsContext)
        
        let expected = CustomerEmailAddressIdentity(id: AddCustomerEmailAddressRequest.__default.emailAddress)

        XCTAssertEqual(try handleAddCustomerEmailAddress(input: input, context: operationsContext), expected)

        let dynamodbTable = operationsContext.dynamodbTable as! InMemoryDynamoDBCompositePrimaryKeyTable

        let internalCustomerId = (PersistenceExampleOperationsContext.customerKeyPrefix + [TestVariables.staticId]).dynamodbKey
        let customerPartition = dynamodbTable.store[internalCustomerId]!

        XCTAssertEqual(2, customerPartition.count) // the email address row plus the customer row

        let customerIdentityRow = customerPartition[internalCustomerId] as! StandardTypedDatabaseItem<CustomerIdentityRow>

        XCTAssertEqual([AddCustomerEmailAddressRequest.__default.emailAddress],
                       customerIdentityRow.rowValue.customerEmailAddressSummary.emailAddresses)
        XCTAssertEqual(5, customerIdentityRow.rowValue.customerEmailAddressSummary.maximum)
        XCTAssertEqual("me@example.com", customerIdentityRow.rowValue.primaryEmailAddress)
    }

    func testAddCustomerEmailAddressUpToLimit() throws {
        let dynamodbTable = createTable()
        
        // create a customer with TestVariables.staticId as its customer ID
        _ = try handleCreateCustomerPut(input: CreateCustomerRequest.__default,
                                        context: createOperationsContext(dynamodbTable: dynamodbTable))
        
        let idGenerator = {
            UUID().uuidString
        }
        let externalCustomerId = (PersistenceExampleOperationsContext.externalCustomerPrefix + [TestVariables.staticId]).dynamodbKey
        let operationsContext = PersistenceExampleOperationsContext(
            dynamodbTable: dynamodbTable,
            idGenerator: idGenerator,
            timestampGenerator: TestVariables.staticTimestampGenerator,
            logger: TestVariables.logger)

        var emailAddresses: [String] = []
        for index in 0..<5 {
            let input = PersistenceExampleModel.AddCustomerEmailAddressRequest(
                emailAddress: "me\(index + 1)@example.com",
                id: externalCustomerId,
                isPrimary: true,
                notifyOnAllActions: false,
                notifyOnImportantAction: false)
            
            if let output = try? handleAddCustomerEmailAddress(input: input, context: operationsContext) {
                emailAddresses.append(output.id)
            }
        }

        let internalCustomerId = (PersistenceExampleOperationsContext.customerKeyPrefix + [TestVariables.staticId]).dynamodbKey
        let customerPartition = dynamodbTable.store[internalCustomerId]!

        XCTAssertEqual(6, customerPartition.count) // all email address rows plus the customer row

        let customerIdentityRow = customerPartition[internalCustomerId] as! StandardTypedDatabaseItem<CustomerIdentityRow>

        XCTAssertEqual(emailAddresses, customerIdentityRow.rowValue.customerEmailAddressSummary.emailAddresses)
        XCTAssertEqual(5, customerIdentityRow.rowValue.customerEmailAddressSummary.maximum)
        XCTAssertEqual("me5@example.com", customerIdentityRow.rowValue.primaryEmailAddress)
    }

    func testAddCustomerEmailAddressOverLimit() throws {
        let idGenerator = {
            UUID().uuidString
        }
        let externalCustomerId = (PersistenceExampleOperationsContext.externalCustomerPrefix + [TestVariables.staticId]).dynamodbKey
        let dynamodbTable = createTable()
        let operationsContext = PersistenceExampleOperationsContext(
            dynamodbTable: dynamodbTable,
            idGenerator: idGenerator,
            timestampGenerator: TestVariables.staticTimestampGenerator,
            logger: TestVariables.logger)
        
        // create a customer with TestVariables.staticId as its customer ID
        _ = try handleCreateCustomerPut(input: CreateCustomerRequest.__default,
                                        context: createOperationsContext(dynamodbTable: dynamodbTable))

        var emailAddresses: [String] = []
        for index in 0..<20 {
            let input = PersistenceExampleModel.AddCustomerEmailAddressRequest(
                emailAddress: "me\(index + 1)@example.com",
                id: externalCustomerId,
                isPrimary: true,
                notifyOnAllActions: false,
                notifyOnImportantAction: false)
            
            if let output = try? handleAddCustomerEmailAddress(input: input, context: operationsContext) {
                emailAddresses.append(output.id)
            }
        }

        do {
            let input = PersistenceExampleModel.AddCustomerEmailAddressRequest(
                emailAddress: "me88@example.com",
                id: externalCustomerId,
                isPrimary: true,
                notifyOnAllActions: false,
                notifyOnImportantAction: false)
            
            let _ = try handleAddCustomerEmailAddress(input: input, context: operationsContext)

            XCTFail("Expected error not thrown.")
        } catch PersistenceExampleError.customerEmailAddressLimitExceeded(_) {

        } catch {
            XCTFail("Expected error not thrown. Instead \(error).")
        }

        let internalCustomerId = (PersistenceExampleOperationsContext.customerKeyPrefix + [TestVariables.staticId]).dynamodbKey
        let customerPartition = dynamodbTable.store[internalCustomerId]!

        XCTAssertEqual(6, customerPartition.count) // maximum email address rows plus the customer row

        let customerIdentityRow = customerPartition[internalCustomerId] as! StandardTypedDatabaseItem<CustomerIdentityRow>

        XCTAssertEqual(emailAddresses, customerIdentityRow.rowValue.customerEmailAddressSummary.emailAddresses)
        XCTAssertEqual(5, customerIdentityRow.rowValue.customerEmailAddressSummary.maximum)
        // adding additional email addresses past the maximum didn't have any impact
        XCTAssertEqual("me5@example.com", customerIdentityRow.rowValue.primaryEmailAddress)
    }

    func testAddCustomerEmailAddressAcceptableConcurrency() throws {
        let input = AddCustomerEmailAddressRequest.__default
        let dynamodbTable = createTable()
        let dynamodbTableWrapper = SimulateConcurrencyDynamoDBCompositePrimaryKeyTable(
            wrappedDynamoDBTable: dynamodbTable,
            simulateConcurrencyModifications: 5,
            simulateOnInsertItem: false) // simulate 5 concurrent attempts
        let operationsContext = PersistenceExampleOperationsContext(
            dynamodbTable: dynamodbTableWrapper,
            idGenerator: TestVariables.staticIdGenerator,
            timestampGenerator: TestVariables.staticTimestampGenerator,
            logger: TestVariables.logger)
        
        // create a customer with TestVariables.staticId as its customer ID
        _ = try handleCreateCustomerPut(input: CreateCustomerRequest.__default,
                                        context: createOperationsContext(dynamodbTable: dynamodbTable))

        let expected = CustomerEmailAddressIdentity(id: AddCustomerEmailAddressRequest.__default.emailAddress)
        XCTAssertEqual(try handleAddCustomerEmailAddress(input: input, context: operationsContext), expected)

        let internalCustomerId = (PersistenceExampleOperationsContext.customerKeyPrefix + [TestVariables.staticId]).dynamodbKey
        let customerPartition = dynamodbTable.store[internalCustomerId]!

        XCTAssertEqual(2, customerPartition.count) // the email address row plus the customer row

        let customerIdentityRow = customerPartition[internalCustomerId] as! StandardTypedDatabaseItem<CustomerIdentityRow>

        XCTAssertEqual([AddCustomerEmailAddressRequest.__default.emailAddress],
                       customerIdentityRow.rowValue.customerEmailAddressSummary.emailAddresses)
        XCTAssertEqual(5, customerIdentityRow.rowValue.customerEmailAddressSummary.maximum)
        XCTAssertEqual(AddCustomerEmailAddressRequest.__default.emailAddress, customerIdentityRow.rowValue.primaryEmailAddress)
    }

    func testAddCustomerEmailAddressUnacceptableConcurrency() throws {
        let input = AddCustomerEmailAddressRequest.__default
        let dynamodbTable = createTable()
        let dynamodbTableWrapper = SimulateConcurrencyDynamoDBCompositePrimaryKeyTable(
            wrappedDynamoDBTable: dynamodbTable,
            simulateConcurrencyModifications: 100,
            simulateOnInsertItem: false)
        let operationsContext = PersistenceExampleOperationsContext(
            dynamodbTable: dynamodbTableWrapper,
            idGenerator: TestVariables.staticIdGenerator,
            timestampGenerator: TestVariables.staticTimestampGenerator,
            logger: TestVariables.logger)
        
        // create a customer with TestVariables.staticId as its customer ID
        _ = try handleCreateCustomerPut(input: CreateCustomerRequest.__default,
                                        context: createOperationsContext(dynamodbTable: dynamodbTable))

        do {
            _ = try handleAddCustomerEmailAddress(input: input, context: operationsContext)

            XCTFail("Expected error not thrown.")
        } catch PersistenceExampleError.concurrency(_) {

        } catch {
            XCTFail("Expected error not thrown. Instead \(error).")
        }

        let internalCustomerId = (PersistenceExampleOperationsContext.customerKeyPrefix + [TestVariables.staticId]).dynamodbKey
        let customerPartition = dynamodbTable.store[internalCustomerId]!

        XCTAssertEqual(1, customerPartition.count) // just the customer row, no email address rows added

        let customerIdentityRow = customerPartition[internalCustomerId] as! StandardTypedDatabaseItem<CustomerIdentityRow>

        XCTAssertEqual([],
                       customerIdentityRow.rowValue.customerEmailAddressSummary.emailAddresses)
        XCTAssertEqual(5, customerIdentityRow.rowValue.customerEmailAddressSummary.maximum)
        XCTAssertNil(customerIdentityRow.rowValue.primaryEmailAddress)
    }

    func testAddCustomerEmailAddressUnknownCustomer() throws {
        let input = AddCustomerEmailAddressRequest.__default
        let operationsContext = createOperationsContext()

        do {
            _ = try handleAddCustomerEmailAddress(input: input, context: operationsContext)

            XCTFail("Expected error not thrown.")
        } catch PersistenceExampleError.unknownResource {

        } catch {
            XCTFail("Expected error not thrown. Instead \(error).")
        }
    }
    
    func testAddCustomerEmailAddressAlreadyRegistered() throws {
        let input = AddCustomerEmailAddressRequest.__default
        let operationsContext = createOperationsContext()
        
        _ = try handleCreateCustomerPut(input: CreateCustomerRequest.__default, context: operationsContext)

        _ = try handleAddCustomerEmailAddress(input: input, context: operationsContext)
        
        do {
            _ = try handleAddCustomerEmailAddress(input: input, context: operationsContext)

            XCTFail("Expected error not thrown.")
        } catch PersistenceExampleError.customerEmailAddressAlreadyExists {

        } catch {
            XCTFail("Expected error not thrown. Instead \(error).")
        }
    }

    static var allTests = [
        ("testAddCustomerEmailAddress", testAddCustomerEmailAddress),
        ("testAddCustomerEmailAddressUpToLimit", testAddCustomerEmailAddressUpToLimit),
        ("testAddCustomerEmailAddressOverLimit", testAddCustomerEmailAddressOverLimit),
        ("testAddCustomerEmailAddressAcceptableConcurrency", testAddCustomerEmailAddressAcceptableConcurrency),
        ("testAddCustomerEmailAddressUnacceptableConcurrency", testAddCustomerEmailAddressUnacceptableConcurrency),
        ("testAddCustomerEmailAddressUnknownCustomer", testAddCustomerEmailAddressUnknownCustomer),
        ("testAddCustomerEmailAddressAlreadyRegistered", testAddCustomerEmailAddressAlreadyRegistered),
        ]
}
