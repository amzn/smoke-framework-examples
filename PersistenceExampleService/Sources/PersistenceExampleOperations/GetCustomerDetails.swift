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
// GetCustomerDetails.swift
// PersistenceExampleOperations
//

import Foundation
import PersistenceExampleModel
import SmokeDynamoDB
import SmokeOperations
import Logging

// The possible row types that can be returned in the Customer paritition
enum CustomerQueryableTypes: PolymorphicOperationReturnType {
    typealias AttributesType = StandardPrimaryKeyAttributes
    
    static var types: [(Codable.Type, PolymorphicOperationReturnOption<StandardPrimaryKeyAttributes, Self>)] = [
        (CustomerIdentityRow.self, .init( {.customerIdentity($0)} )),
        (CustomerEmailAddressRow.self, .init( {.customerEmailAddressRow($0)} )),
        ]
    
    case customerIdentity(StandardTypedDatabaseItem<CustomerIdentityRow>)
    case customerEmailAddressRow(StandardTypedDatabaseItem<CustomerEmailAddressRow>)
}

/**
 Handler for the GetCustomerDetails operation.

 - Parameters:
     - input: The validated GetCustomerDetailsRequest object being passed to this operation.
     - context: The context provided for this operation.
 - Returns: The CustomerAttributes object to be passed back from the caller of this operation.
     Will be validated before being returned to caller.
 - Throws: unknownResource.
 */
extension PersistenceExampleOperationsContext {
    public func handleGetCustomerDetails(input: PersistenceExampleModel.GetCustomerDetailsRequest) throws
    -> PersistenceExampleModel.CustomerAttributes {
        guard let customerIDKeyPostfix =
            PersistenceExampleOperationsContext.externalCustomerPrefix.dropAsDynamoDBKeyPrefix(from: input.id) else {
                throw SmokeOperationsError.validationError(reason: "Invalid customer ID '\(input.id)")
        }
        
        let customerKey = (PersistenceExampleOperationsContext.customerKeyPrefix + [customerIDKeyPostfix]).dynamodbKey
        
        // Query on the customer partition, that will return the customer identity row and any email address rows
        self.logger.debug("Query on customer: \(customerKey)")
        let queryItems: [CustomerQueryableTypes] =
            try self.dynamodbTable.query(forPartitionKey: customerKey, sortKeyCondition: nil).wait()
        
        // iterate through each item returned
        var coreCustomerAttributes: CoreCustomerAttributes?
        var customerEmailAddressAttributesList: [CustomerEmailAddressAttributes] = []
        
        // iterate through each item returned
        for item in queryItems {
            switch item {
            case .customerIdentity(let databaseItem):
                coreCustomerAttributes = databaseItem.rowValue.coreAttributes
            case .customerEmailAddressRow(let databaseItem):
                customerEmailAddressAttributesList.append(databaseItem.rowValue.attributes)
            }
        }
        
        // ensure all rows are present
        guard let theCoreCustomerAttributes = coreCustomerAttributes else {
            let unknownResourceFault = UnknownResourceFault(message: "Attempt to retrieve customer details failed due to unknown customer.")
            throw PersistenceExampleError.unknownResource(unknownResourceFault)
        }
        
        // sort the returned email addresses
        customerEmailAddressAttributesList.sort { (left, right) in
            left.emailAddress < right.emailAddress
        }
        
        return CustomerAttributes(birthYear: theCoreCustomerAttributes.birthYear,
                                  emailAddresses: customerEmailAddressAttributesList,
                                  firstName: theCoreCustomerAttributes.firstName,
                                  gender: theCoreCustomerAttributes.gender,
                                  lastName: theCoreCustomerAttributes.lastName)
    }
}
