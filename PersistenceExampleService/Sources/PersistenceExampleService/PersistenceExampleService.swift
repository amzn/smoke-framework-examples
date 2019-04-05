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
// PersistenceExampleService.swift
// PersistenceExampleService
//

import Foundation
import PersistenceExampleOperationsHTTP1
import PersistenceExampleOperations
import SmokeHTTP1
import SmokeOperationsHTTP1
import SmokeAWSCredentials
import SmokeAWSCore
import SmokeDynamoDB
import NIO
import SmokeHTTPClient
import LoggerAPI

struct EnvironmentVariables {
    static let dynamoEndpointHostName = "DYNAMO_ENDPOINT_HOST_NAME"
    static let dynamoTableName = "DYNAMO_TABLE_NAME"
    static let region = "REGION"
    
    static func getEnvironment() -> [String: String] {
        #if DEBUG
        let environment = [EnvironmentVariables.dynamoEndpointHostName: "dynamodb.us-west-2.amazonaws.com",
                           EnvironmentVariables.dynamoTableName: "ServiceStack-PersistenceExampleTable",
                           EnvironmentVariables.region: "us-west-2",
                           AwsContainerRotatingCredentialsProvider.devIamRoleArnEnvironmentVariable:
                               "arn:aws:iam::000000000000:role/EcsTaskExecutionRole"]
        #else
        let environment = ProcessInfo.processInfo.environment
        #endif
        
        return environment
    }
}

public enum PersistenceExampleServiceError: Error {
    case missingEnvironmentVariable(reason: String)
}

public func initializeDynamoDBTableFromEnvironment(
        environment: [String: String],
        credentialsProvider: CredentialsProvider,
        region: AWSRegion,
        clientEventLoopProvider: HTTPClient.EventLoopProvider) throws -> AWSDynamoDBTable {
    guard let dynamoEndpointHostName = environment[EnvironmentVariables.dynamoEndpointHostName] else {
        throw PersistenceExampleServiceError.missingEnvironmentVariable(reason:
            "'\(EnvironmentVariables.dynamoEndpointHostName)' environment variable not specified.")
    }
    
    guard let dynamoTableName = environment[EnvironmentVariables.dynamoTableName] else {
        throw PersistenceExampleServiceError.missingEnvironmentVariable(reason:
            "\(EnvironmentVariables.dynamoTableName)' environment variable not specified.")
    }
    
    return AWSDynamoDBTable(credentialsProvider: credentialsProvider,
                           region: region, endpointHostName: dynamoEndpointHostName,
                           tableName: dynamoTableName,
                           eventLoopProvider: clientEventLoopProvider)
}

func handleApplication() {
    CloudwatchStandardErrorLogger.enableLogging()
    
    let environment = EnvironmentVariables.getEnvironment()
    
    let clientEventLoopGroup =
        MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)
    let clientEventLoopProvider = HTTPClient.EventLoopProvider.use(clientEventLoopGroup)
    
    let idGenerator = {
        UUID().uuidString
    }
    
    let timestampGenerator = {
        return "\(Date().timeIntervalSinceReferenceDate)"
    }
    
    guard let credentialsProvider = AwsContainerRotatingCredentialsProvider.get(
            fromEnvironment: environment,
            eventLoopProvider: clientEventLoopProvider) else {
        return Log.error("Unable to obtain credentials from the container environment.")
    }
    
    guard let regionString = environment[EnvironmentVariables.region] else {
        return Log.error("'\(EnvironmentVariables.region)' environment variable not specified.")
    }
    
    guard let region = AWSRegion(rawValue: regionString) else {
        return Log.error("Specified '\(EnvironmentVariables.region)' environment variable '\(regionString)' not a valid region.")
    }

    let dynamodbTable: AWSDynamoDBTable
    do {
        dynamodbTable = try initializeDynamoDBTableFromEnvironment(
            environment: environment,
            credentialsProvider: credentialsProvider,
            region: region,
            clientEventLoopProvider: clientEventLoopProvider)
    } catch {
        Log.error("Unable to inialize DynamoDB Table - \(error).")
        
        return
    }

    let operationsContext = PersistenceExampleOperationsContext(dynamodbTable: dynamodbTable,
                                                                idGenerator: idGenerator,
                                                                timestampGenerator: timestampGenerator)

    do {
        let smokeHTTP1Server = try SmokeHTTP1Server.startAsOperationServer(
            withHandlerSelector: createHandlerSelector(),
            andContext: operationsContext)
        
        try smokeHTTP1Server.waitUntilShutdownAndThen {
            dynamodbTable.close()
            dynamodbTable.wait()
            
            credentialsProvider.stop()
            credentialsProvider.wait()
            
            do {
                try clientEventLoopGroup.syncShutdownGracefully()
            } catch {
                Log.error("Unable to shutdown client thread loop: '\(error)'")
            }
        }
    } catch {
        Log.error("Unable to start Operations Server: '\(error)'")
    }
}
