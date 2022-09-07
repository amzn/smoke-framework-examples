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
// NoExistentialTypesExampleOperationsContext.swift
// NoExistentialTypesExampleOperations
//

import Foundation
import SmokeDynamoDB
import Logging

public enum OperationsAttributes {
    static let customerKeyPrefix = ["pe", "customer"]
    static let customerEmailAddressPrefix = ["pe", "customer", "email", "address"]
    
    static let externalCustomerPrefix = ["com", "mycompany", "pe", "customer"]
    
    public static let defaultCustomerEmailAddressLimit = 5
}

/**
 The context to be passed to each of the NoExistentialTypesExample operations.
 */
public struct NoExistentialTypesExampleOperationsContext<DynamoDBTableType: DynamoDBCompositePrimaryKeyTable> {
    public let dynamodbTable: DynamoDBTableType
    public let idGenerator: () -> String
    public let timestampGenerator: () -> String
    public let logger: Logger
    
    public init(dynamodbTable: DynamoDBTableType, idGenerator: @escaping () -> String,
                timestampGenerator: @escaping () -> String,
                logger: Logger) {
        self.dynamodbTable = dynamodbTable
        self.idGenerator = idGenerator
        self.timestampGenerator = timestampGenerator
        self.logger = logger
    }
}
