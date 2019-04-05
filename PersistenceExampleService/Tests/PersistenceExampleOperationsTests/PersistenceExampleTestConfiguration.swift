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
// PersistenceExampleTestConfiguration.swift
// PersistenceExampleOperationsTests
//

import XCTest
@testable import PersistenceExampleOperations
import PersistenceExampleModel
import SmokeDynamoDB

let STATIC_ID = "53E2BFA1-E55C-42FE-8110-77A68C069EF4"
let STATIC_ID_GENERATOR = {
    return STATIC_ID
}

let STATIC_TIMESTAMP = "987654.7654"
let STATIC_TIMESTAMP_GENERATOR = {
    return STATIC_TIMESTAMP
}

func createTable() -> InMemoryDynamoDBTable {
    return InMemoryDynamoDBTable()
}

func createOperationsContext(dynamodbTable: DynamoDBTable = createTable()) -> PersistenceExampleOperationsContext {
    return PersistenceExampleOperationsContext(dynamodbTable: dynamodbTable,
                                               idGenerator: STATIC_ID_GENERATOR,
                                               timestampGenerator: STATIC_TIMESTAMP_GENERATOR)
}
