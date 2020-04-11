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
// PersistenceExampleOperationsContext.swift
// PersistenceExampleOperationsHTTP1
//

import Foundation
import PersistenceExampleOperations
import SmokeDynamoDB
import SmokeOperations
import SmokeOperationsHTTP1Server
import SmokeHTTPClient
import SmokeAWSHttp

/**
 The context to be passed to each of the PersistenceExample operations.
 */
public struct PersistenceExampleOperationsContextGenerator {
    public let dynamodbTableGenerator: AWSDynamoDBTableGenerator
    public let idGenerator: () -> String
    public let timestampGenerator: () -> String
    public let awsClientInvocationTraceContext: AWSClientInvocationTraceContext
    
    public init(dynamodbTableGenerator: AWSDynamoDBTableGenerator, idGenerator: @escaping () -> String,
                timestampGenerator: @escaping () -> String,
                awsClientInvocationTraceContext: AWSClientInvocationTraceContext) {
        self.dynamodbTableGenerator = dynamodbTableGenerator
        self.idGenerator = idGenerator
        self.timestampGenerator = timestampGenerator
        self.awsClientInvocationTraceContext = awsClientInvocationTraceContext
    }
    
    public func get(invocationReporting: SmokeServerInvocationReporting<SmokeInvocationTraceContext>) -> PersistenceExampleOperationsContext {
        let awsClientInvocationReporting = invocationReporting.withInvocationTraceContext(traceContext: awsClientInvocationTraceContext)
        let dynamodbTable = self.dynamodbTableGenerator.with(reporting: awsClientInvocationReporting)
        
        return PersistenceExampleOperationsContext(dynamodbTable: dynamodbTable,
                                                   idGenerator: self.idGenerator,
                                                   timestampGenerator: self.timestampGenerator,
                                                   logger: invocationReporting.logger)
    }
}
