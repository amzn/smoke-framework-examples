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
import Logging
import NIO

class EventLoopAwareTestCase: XCTestCase {
    var eventLoopGroup: EventLoopGroup?
    var eventLoop: EventLoop!
    
    override func setUp() {
        super.setUp()
        
        let newEventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: 1)
        eventLoop = newEventLoopGroup.next()
        eventLoopGroup = newEventLoopGroup
    }

    override func tearDown() {
        super.tearDown()
        
        try? eventLoopGroup?.syncShutdownGracefully()
        eventLoop = nil
    }
}

struct TestVariables {
    static let staticId = "53E2BFA1-E55C-42FE-8110-77A68C069EF4"
    static let staticIdGenerator = {
        return staticId
    }

    static let staticTimestamp = "987654.7654"
    static let staticTimestampGenerator = {
        return staticTimestamp
    }
    
    static let logger = Logger(label: "PersistenceExampleTestConfiguration")
}

func createTable(eventLoop: EventLoop) -> InMemoryDynamoDBCompositePrimaryKeyTable {
    return InMemoryDynamoDBCompositePrimaryKeyTable(eventLoop: eventLoop)
}

func createOperationsContext(eventLoop: EventLoop,
                             dynamodbTable dynamodbTableOptional: DynamoDBCompositePrimaryKeyTable? = nil) -> PersistenceExampleOperationsContext {
    let dynamodbTable = dynamodbTableOptional ?? createTable(eventLoop: eventLoop)
    
    return PersistenceExampleOperationsContext(dynamodbTable: dynamodbTable,
                                               idGenerator: TestVariables.staticIdGenerator,
                                               timestampGenerator: TestVariables.staticTimestampGenerator,
                                               logger: TestVariables.logger)
}
