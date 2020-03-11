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
struct CustomerCodableTypes: PossibleItemTypes {
    public static var types: [Codable.Type] = [CustomerIdentityRow.self,
                                               CustomerEmailAddressRow.self]
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
public func handleGetCustomerDetails(
        input: PersistenceExampleModel.GetCustomerDetailsRequest,
        context: PersistenceExampleOperationsContext) throws -> PersistenceExampleModel.CustomerAttributes {
    guard let customerIDKeyPostfix =
        PersistenceExampleOperationsContext.externalCustomerPrefix.dropAsDynamoDBKeyPrefix(from: input.id) else {
            throw SmokeOperationsError.validationError(reason: "Invalid customer ID '\(input.id)")
    }
    
    let customerKey = (PersistenceExampleOperationsContext.customerKeyPrefix + [customerIDKeyPostfix]).dynamodbKey
    
    // Query on the customer partition, that will return the customer identity row and any email address rows
    context.logger.debug("Query on customer: \(customerKey)")
    let queryItems: [StandardPolymorphicDatabaseItem<CustomerCodableTypes>] =
            try context.dynamodbTable.querySync(forPartitionKey: customerKey, sortKeyCondition: nil)
    
    // iterate through each item returned
    var coreCustomerAttributes: CoreCustomerAttributes?
    var customerEmailAddressAttributesList: [CustomerEmailAddressAttributes] = []
    
    // iterate through each item returned
    for item in queryItems {
        if let customerIdentityRow = item.rowValue as? CustomerIdentityRow {
            coreCustomerAttributes = customerIdentityRow.coreAttributes
        } else if let customerEmailAddressRow = item.rowValue as? CustomerEmailAddressRow {
            customerEmailAddressAttributesList.append(customerEmailAddressRow.attributes)
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
