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
import SmokeAWSHttp
import AsyncHTTPClient
import Logging

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

public func initializeDynamoDBTableGeneratorFromEnvironment(
        environment: [String: String],
        credentialsProvider: CredentialsProvider,
        region: AWSRegion,
        clientEventLoopProvider: HTTPClient.EventLoopGroupProvider) throws -> AWSDynamoDBTableGenerator {
    guard let dynamoEndpointHostName = environment[EnvironmentVariables.dynamoEndpointHostName] else {
        throw PersistenceExampleServiceError.missingEnvironmentVariable(reason:
            "'\(EnvironmentVariables.dynamoEndpointHostName)' environment variable not specified.")
    }
    
    guard let dynamoTableName = environment[EnvironmentVariables.dynamoTableName] else {
        throw PersistenceExampleServiceError.missingEnvironmentVariable(reason:
            "\(EnvironmentVariables.dynamoTableName)' environment variable not specified.")
    }
    
    return AWSDynamoDBTableGenerator(credentialsProvider: credentialsProvider,
                                     region: region, endpointHostName: dynamoEndpointHostName,
                                     tableName: dynamoTableName,
                                     eventLoopProvider: clientEventLoopProvider)
}

func handleApplication() {
    CloudwatchStandardErrorLogger.enableLogging()
    
    let environment = EnvironmentVariables.getEnvironment()
    
    let clientEventLoopGroup =
        MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)
    let clientEventLoopProvider = HTTPClient.EventLoopGroupProvider.shared(clientEventLoopGroup)
    
    let idGenerator = {
        UUID().uuidString
    }
    
    let timestampGenerator = {
        return "\(Date().timeIntervalSinceReferenceDate)"
    }
    
    let logger = Logger(label: "PersistenceExampleService")
    let awsClientInvocationTraceContext = AWSClientInvocationTraceContext()
    
    guard let credentialsProvider = AwsContainerRotatingCredentialsProvider.get(
            fromEnvironment: environment,
            logger: logger,
            traceContext: awsClientInvocationTraceContext,
            eventLoopProvider: clientEventLoopProvider) else {
        return logger.error("Unable to obtain credentials from the container environment.")
    }
    
    guard let regionString = environment[EnvironmentVariables.region] else {
        return logger.error("'\(EnvironmentVariables.region)' environment variable not specified.")
    }
    
    guard let region = AWSRegion(rawValue: regionString) else {
        return logger.error("Specified '\(EnvironmentVariables.region)' environment variable '\(regionString)' not a valid region.")
    }

    let dynamodbTableGenerator: AWSDynamoDBTableGenerator
    do {
        dynamodbTableGenerator = try initializeDynamoDBTableGeneratorFromEnvironment(
            environment: environment,
            credentialsProvider: credentialsProvider,
            region: region,
            clientEventLoopProvider: clientEventLoopProvider)
    } catch {
        logger.error("Unable to inialize DynamoDB Table - \(error).")
        
        return
    }

    let operationsContextGenerator = PersistenceExampleOperationsContextGenerator(dynamodbTableGenerator: dynamodbTableGenerator,
                                                                                 idGenerator: idGenerator,
                                                                                 timestampGenerator: timestampGenerator,
                                                                                 awsClientInvocationTraceContext: awsClientInvocationTraceContext)

    do {
        let smokeHTTP1Server = try SmokeHTTP1Server.startAsOperationServer(
            withHandlerSelector: createHandlerSelector(),
            andContextProvider: operationsContextGenerator.get)
        
        try smokeHTTP1Server.waitUntilShutdownAndThen {
            do {
                try dynamodbTableGenerator.close()
                try credentialsProvider.stop()
                
                try clientEventLoopGroup.syncShutdownGracefully()
            } catch {
                logger.error("Unable to shutdown cleanly: '\(error)'")
            }
        }
    } catch {
        logger.error("Unable to start Operations Server: '\(error)'")
    }
}
