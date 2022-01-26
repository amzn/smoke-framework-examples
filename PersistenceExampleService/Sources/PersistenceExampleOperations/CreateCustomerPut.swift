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
// CreateCustomerPut.swift
// PersistenceExampleOperations
//

import Foundation
import PersistenceExampleModel
import SmokeDynamoDB

extension PersistenceExampleModel.CreateCustomerRequest: PersistenceExampleModel.CoreCustomerAttributesShape {}

/**
 Handler for the CreateCustomerPut operation.

 - Parameters:
     - input: The validated CreateCustomerRequest object being passed to this operation.
     - context: The context provided for this operation.
 - Returns: The CreateCustomerPut200Response object to be passed back from the caller of this operation.
     Will be validated before being returned to caller.
 - Throws: unknownResource.
 */
extension PersistenceExampleOperationsContext {
    public func handleCreateCustomerPut(input: PersistenceExampleModel.CreateCustomerRequest) async throws
    -> PersistenceExampleModel.CreateCustomerPut200Response {
        // create a new customer id
        let customerId = self.idGenerator()
        let partitionKey = (PersistenceExampleOperationsContext.customerKeyPrefix + [customerId]).dynamodbKey
        
        let customerEmailAddressSummary = CustomerEmailAddressSummary(
            emailAddresses: [],
            maximum: PersistenceExampleOperationsContext.defaultCustomerEmailAddressLimit)
        let newCustomerIdentityRow = CustomerIdentityRow(
            customerEmailAddressSummary: customerEmailAddressSummary,
            customerID: customerId,
            coreAttributes: try input.asPersistenceExampleModelCoreCustomerAttributes(),
            primaryEmailAddress: nil)
        
        // put the customer row under the partition identity row
        let key = StandardCompositePrimaryKey(partitionKey: partitionKey, sortKey: partitionKey)
        let newDatabaseItem = StandardTypedDatabaseItem.newItem(withKey: key, andValue: newCustomerIdentityRow)
        
        try await self.dynamodbTable.insertItem(newDatabaseItem)
        
        let externalCustomerId = (PersistenceExampleOperationsContext.externalCustomerPrefix + [customerId]).dynamodbKey
        
        let response = CreateCustomerPut200Response(xRequestID: self.idGenerator(),
                                                    id: externalCustomerId)
        
        return response
    }
}
