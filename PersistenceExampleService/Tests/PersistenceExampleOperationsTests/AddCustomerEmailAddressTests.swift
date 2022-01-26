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

class AddCustomerEmailAddressTests: EventLoopAwareTestCase {

    func testAddCustomerEmailAddress() async throws {
        let input = AddCustomerEmailAddressRequest.__default
        let operationsContext = createOperationsContext(eventLoop: self.eventLoop)
        
        _ = try await operationsContext.handleCreateCustomerPut(input: CreateCustomerRequest.__default)
        
        let expected = CustomerEmailAddressIdentity(id: AddCustomerEmailAddressRequest.__default.emailAddress)

        let response = try await operationsContext.handleAddCustomerEmailAddress(input: input)
        XCTAssertEqual(response, expected)

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

    func testAddCustomerEmailAddressUpToLimit() async throws {
        let dynamodbTable = createTable(eventLoop: self.eventLoop)
        let putOperationContext = createOperationsContext(eventLoop: self.eventLoop, dynamodbTable: dynamodbTable)
        
        // create a customer with TestVariables.staticId as its customer ID
        _ = try await putOperationContext.handleCreateCustomerPut(input: CreateCustomerRequest.__default)
        
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
            
            if let output = try? await operationsContext.handleAddCustomerEmailAddress(input: input) {
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

    func testAddCustomerEmailAddressOverLimit() async throws {
        let idGenerator = {
            UUID().uuidString
        }
        let externalCustomerId = (PersistenceExampleOperationsContext.externalCustomerPrefix + [TestVariables.staticId]).dynamodbKey
        let dynamodbTable = createTable(eventLoop: self.eventLoop)
        let operationsContext = PersistenceExampleOperationsContext(
            dynamodbTable: dynamodbTable,
            idGenerator: idGenerator,
            timestampGenerator: TestVariables.staticTimestampGenerator,
            logger: TestVariables.logger)
        
        // create a customer with TestVariables.staticId as its customer ID
        let putOperationContext = createOperationsContext(eventLoop: self.eventLoop, dynamodbTable: dynamodbTable)
        _ = try await putOperationContext.handleCreateCustomerPut(input: CreateCustomerRequest.__default)

        var emailAddresses: [String] = []
        for index in 0..<20 {
            let input = PersistenceExampleModel.AddCustomerEmailAddressRequest(
                emailAddress: "me\(index + 1)@example.com",
                id: externalCustomerId,
                isPrimary: true,
                notifyOnAllActions: false,
                notifyOnImportantAction: false)
            
            if let output = try? await operationsContext.handleAddCustomerEmailAddress(input: input) {
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
            
            let _ = try await operationsContext.handleAddCustomerEmailAddress(input: input)

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

    func testAddCustomerEmailAddressAcceptableConcurrency() async throws {
        let input = AddCustomerEmailAddressRequest.__default
        let dynamodbTable = createTable(eventLoop: self.eventLoop)
        let dynamodbTableWrapper = SimulateConcurrencyDynamoDBCompositePrimaryKeyTable(
            wrappedDynamoDBTable: dynamodbTable,
            eventLoop: self.eventLoop,
            simulateConcurrencyModifications: 5,
            simulateOnInsertItem: false) // simulate 5 concurrent attempts
        let operationsContext = PersistenceExampleOperationsContext(
            dynamodbTable: dynamodbTableWrapper,
            idGenerator: TestVariables.staticIdGenerator,
            timestampGenerator: TestVariables.staticTimestampGenerator,
            logger: TestVariables.logger)
        
        // create a customer with TestVariables.staticId as its customer ID
        let putOperationContext = createOperationsContext(eventLoop: self.eventLoop, dynamodbTable: dynamodbTable)
        _ = try await putOperationContext.handleCreateCustomerPut(input: CreateCustomerRequest.__default)

        let expected = CustomerEmailAddressIdentity(id: AddCustomerEmailAddressRequest.__default.emailAddress)
        let response = try await operationsContext.handleAddCustomerEmailAddress(input: input)
        XCTAssertEqual(response, expected)

        let internalCustomerId = (PersistenceExampleOperationsContext.customerKeyPrefix + [TestVariables.staticId]).dynamodbKey
        let customerPartition = dynamodbTable.store[internalCustomerId]!

        XCTAssertEqual(2, customerPartition.count) // the email address row plus the customer row

        let customerIdentityRow = customerPartition[internalCustomerId] as! StandardTypedDatabaseItem<CustomerIdentityRow>

        XCTAssertEqual([AddCustomerEmailAddressRequest.__default.emailAddress],
                       customerIdentityRow.rowValue.customerEmailAddressSummary.emailAddresses)
        XCTAssertEqual(5, customerIdentityRow.rowValue.customerEmailAddressSummary.maximum)
        XCTAssertEqual(AddCustomerEmailAddressRequest.__default.emailAddress, customerIdentityRow.rowValue.primaryEmailAddress)
    }

    func testAddCustomerEmailAddressUnacceptableConcurrency() async throws {
        let input = AddCustomerEmailAddressRequest.__default
        let dynamodbTable = createTable(eventLoop: self.eventLoop)
        let dynamodbTableWrapper = SimulateConcurrencyDynamoDBCompositePrimaryKeyTable(
            wrappedDynamoDBTable: dynamodbTable,
            eventLoop: self.eventLoop,
            simulateConcurrencyModifications: 100,
            simulateOnInsertItem: false)
        let operationsContext = PersistenceExampleOperationsContext(
            dynamodbTable: dynamodbTableWrapper,
            idGenerator: TestVariables.staticIdGenerator,
            timestampGenerator: TestVariables.staticTimestampGenerator,
            logger: TestVariables.logger)
        
        // create a customer with TestVariables.staticId as its customer ID
        let putOperationContext = createOperationsContext(eventLoop: self.eventLoop, dynamodbTable: dynamodbTable)
        _ = try await putOperationContext.handleCreateCustomerPut(input: CreateCustomerRequest.__default)

        do {
            _ = try await operationsContext.handleAddCustomerEmailAddress(input: input)

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

    func testAddCustomerEmailAddressUnknownCustomer() async throws {
        let input = AddCustomerEmailAddressRequest.__default
        let operationsContext = createOperationsContext(eventLoop: self.eventLoop)

        do {
            _ = try await operationsContext.handleAddCustomerEmailAddress(input: input)

            XCTFail("Expected error not thrown.")
        } catch PersistenceExampleError.unknownResource {

        } catch {
            XCTFail("Expected error not thrown. Instead \(error).")
        }
    }
    
    func testAddCustomerEmailAddressAlreadyRegistered() async throws {
        let input = AddCustomerEmailAddressRequest.__default
        let operationsContext = createOperationsContext(eventLoop: self.eventLoop)
        
        _ = try await operationsContext.handleCreateCustomerPut(input: CreateCustomerRequest.__default)

        _ = try await operationsContext.handleAddCustomerEmailAddress(input: input)
        
        do {
            _ = try await operationsContext.handleAddCustomerEmailAddress(input: input)

            XCTFail("Expected error not thrown.")
        } catch PersistenceExampleError.customerEmailAddressAlreadyExists {

        } catch {
            XCTFail("Expected error not thrown. Instead \(error).")
        }
    }
}
