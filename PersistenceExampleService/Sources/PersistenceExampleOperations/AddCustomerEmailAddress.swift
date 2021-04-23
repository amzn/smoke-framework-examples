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
// AddCustomerEmailAddress.swift
// PersistenceExampleOperations
//

import Foundation
import PersistenceExampleModel
import SmokeOperations
import SmokeDynamoDB
import Logging
import NIO

extension PersistenceExampleModel.AddCustomerEmailAddressRequest: PersistenceExampleModel.CustomerEmailAddressAttributesShape { }

private typealias CustomerEmailAddressRowIdentity = (emailAddress: String, rowKey: StandardCompositePrimaryKey)
private typealias UpdatedPayloadProviderType = (CustomerIdentityRow) -> EventLoopFuture<CustomerIdentityRow>

/**
 Handler for the AddCustomerEmailAddress operation.

 - Parameters:
     - input: The validated AddCustomerEmailAddressRequest object being passed to this operation.
     - context: The context provided for this operation.
 - Returns: The CustomerEmailAddressIdentity object to be passed back from the caller of this operation.
     Will be validated before being returned to caller.
 - Throws: unknownResource, concurrency, customerEmailAddressLimitExceeded.
 */
extension PersistenceExampleOperationsContext {
    public func handleAddCustomerEmailAddress(input: PersistenceExampleModel.AddCustomerEmailAddressRequest) throws
    -> PersistenceExampleModel.CustomerEmailAddressIdentity {
        guard let customerID = PersistenceExampleOperationsContext.externalCustomerPrefix.dropAsDynamoDBKeyPrefix(from: input.id) else {
            throw SmokeOperationsError.validationError(reason: "Invalid input customer ID '\(input.id)")
        }
        
        let partitionKey = (PersistenceExampleOperationsContext.customerKeyPrefix + [customerID]).dynamodbKey
        let customerKey = StandardCompositePrimaryKey(partitionKey: partitionKey, sortKey: partitionKey)
        var customerEmailAddressRowIdentity: CustomerEmailAddressRowIdentity?
        
        // Create a function that provides an updated payload
        // This is called for each attempt to update the customer row.
        // Captures customerEmailAddressRowIdentity and stores the row identity there
        let updatedPayloadProvider: UpdatedPayloadProviderType = { payload in
            let maximum = payload.customerEmailAddressSummary.maximum

            // fail if there are too many email addresses for this customer
            guard payload.customerEmailAddressSummary.emailAddresses.count < maximum else {
                let promise = self.dynamodbTable.eventLoop.makePromise(of: CustomerIdentityRow.self)
                let message = "Maximum number of email addresses - \(maximum) - reached."
                let error = PersistenceExampleModel.PersistenceExampleError.customerEmailAddressLimitExceeded(
                    CustomerEmailAddressLimitExceededFault(message: message))
                promise.fail(error)
                return promise.futureResult
            }

            // if the row has already been created
            let currentEmailAddressFuture: EventLoopFuture<String>
            if let existingRowIdentity = customerEmailAddressRowIdentity {
                let promise = self.dynamodbTable.eventLoop.makePromise(of: String.self)
                promise.succeed(existingRowIdentity.emailAddress)
                currentEmailAddressFuture = promise.futureResult
            } else {
                // otherwise can proceed with creating the email address row
                let currentEmailAddress = input.emailAddress
                currentEmailAddressFuture = addCustomerEmailAddressRowToDatabase(
                    currentEmailAddress: currentEmailAddress,
                    customerKey: customerKey,
                    input: input) .map { returnedIdentity in
                        customerEmailAddressRowIdentity = returnedIdentity
                        return currentEmailAddress
                    }
            }

            return currentEmailAddressFuture.map { currentEmailAddress in
                // create the updated payload
                var updatedPayload = payload
                updatedPayload.customerEmailAddressSummary.emailAddresses.append(currentEmailAddress)
                
                // if this customer doesn't have a primary email address or
                // it is requested that this is primary, this is now primary
                if updatedPayload.primaryEmailAddress == nil || input.isPrimary ?? false {
                    updatedPayload.primaryEmailAddress = currentEmailAddress
                }

                return updatedPayload
            }
        }
        
        do {
            try self.dynamodbTable.conditionallyUpdateItem(
                forKey: customerKey,
                updatedPayloadProvider: updatedPayloadProvider).wait()
        } catch SmokeDynamoDBError.concurrencyError {
            // if the row exists, make sure it is deleted
            if let rowIdentity = customerEmailAddressRowIdentity {
                try self.dynamodbTable.deleteItem(forKey: rowIdentity.rowKey).wait()
            }

            let concurrencyFault = ConcurrencyFault(message: "Attempt to add email address failed due to concurrent database access.")
            throw PersistenceExampleError.concurrency(concurrencyFault)
        } catch SmokeDynamoDBError.conditionalCheckFailed {
            // if the row exists, make sure it is deleted
            if let rowIdentity = customerEmailAddressRowIdentity {
                try self.dynamodbTable.deleteItem(forKey: rowIdentity.rowKey).wait()
            }

            let unknownResourceFault = UnknownResourceFault(message: "Attempt to add email address failed due to unknown customer.")
            throw PersistenceExampleError.unknownResource(unknownResourceFault)
        }
        
        // This shouldn't occur as the row identity should be created during updateItemConditionallyAtKey
        guard let rowIdentity = customerEmailAddressRowIdentity else {
            throw SmokeDynamoDBError.unexpectedResponse(reason: "Unexpectedly customer email address row not created.")
        }
        
        self.logger.info("Email Address '\(rowIdentity.emailAddress)' created for customer '\(customerID)'")
        return PersistenceExampleModel.CustomerEmailAddressIdentity(id: rowIdentity.emailAddress)
    }

    private func addCustomerEmailAddressRowToDatabase(
            currentEmailAddress: String,
            customerKey: StandardCompositePrimaryKey,
            input: PersistenceExampleModel.AddCustomerEmailAddressRequest) -> EventLoopFuture<CustomerEmailAddressRowIdentity> {
        let customerEmailAddressID = (PersistenceExampleOperationsContext.customerEmailAddressPrefix + [currentEmailAddress]).dynamodbKey

        let customerEmailAddressKey = StandardCompositePrimaryKey(partitionKey: customerKey.partitionKey,
                                                                       sortKey: customerEmailAddressID)
        // store the row identity so future attempts to update the customer row can use this row
        // rather than creating another row
        let notificationTargetRowIdentity = (currentEmailAddress, customerEmailAddressKey)
        let row = CustomerEmailAddressRow(attributes: input.asPersistenceExampleModelCustomerEmailAddressAttributes(),
                                          emailAddress: currentEmailAddress)

        let newDatabaseRow = TypedDatabaseItem.newItem(withKey: customerEmailAddressKey, andValue: row)

        return self.dynamodbTable.insertItem(newDatabaseRow).map { _ in
            return notificationTargetRowIdentity
        } .flatMapErrorThrowing { error in
            if case SmokeDynamoDBError.conditionalCheckFailed = error {
                let customerEmailAddressAlreadyExistsFault = CustomerEmailAddressAlreadyExistsFault(message:
                            "Attempt to add email address failed as email address already registered.")
                        throw PersistenceExampleError.customerEmailAddressAlreadyExists(customerEmailAddressAlreadyExistsFault)
            }
            
            throw error
        }
    }
}
