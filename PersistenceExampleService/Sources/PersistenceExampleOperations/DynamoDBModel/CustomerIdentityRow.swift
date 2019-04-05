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
//  CustomerIdentityRow.swift
//  PersistenceExampleOperations
//

import Foundation
import PersistenceExampleModel

public struct CustomerIdentityRow: Codable, Equatable {
    public var customerEmailAddressSummary: CustomerEmailAddressSummary
    public var customerID: CustomerID
    public var coreAttributes: CoreCustomerAttributes
    public var primaryEmailAddress: CustomerEmailAddress?

    public init(customerEmailAddressSummary: CustomerEmailAddressSummary,
                customerID: CustomerID,
                coreAttributes: CoreCustomerAttributes,
                primaryEmailAddress: CustomerEmailAddress?) {
        self.customerEmailAddressSummary = customerEmailAddressSummary
        self.customerID = customerID
        self.coreAttributes = coreAttributes
        self.primaryEmailAddress = primaryEmailAddress
    }
}
