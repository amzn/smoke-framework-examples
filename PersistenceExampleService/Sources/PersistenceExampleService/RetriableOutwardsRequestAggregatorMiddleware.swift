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
// RetriableOutwardsRequestAggregatorMiddleware.swift
// PersistenceExampleService
//

import Foundation
import HttpMiddleware
import HttpServerMiddleware
import SmokeOperationsHTTP1
import SmokeHTTPClientMiddleware

/// Just as an example, in reality this would live elsewhere
public struct RetriableOutwardsRequestAggregatorMiddleware: MiddlewareProtocol {
    public let id = "RetriableOutwardsRequestAggregator"
    
    
    public init() {
        
    }
    
    public func handle<HandlerType>(input: SmokeHTTPServerRequest,
                                    context: MiddlewareContext, next: HandlerType) async throws
    -> SmokeHTTPServerResponse
    where HandlerType : MiddlewareHandlerProtocol, SmokeHTTPServerRequest == HandlerType.InputType,
    SmokeHTTPServerResponse == HandlerType.OutputType {
        let aggregator = RetriableOutwardsRequestAggregator()
        
        let response = try await RetriableOutwardsRequestAggregator.$aggregator.withValue(aggregator) {
            return try await next.handle(input: input, context: context)
        }
        
        let records = await aggregator.retriableOutputRequestRecords
        
        context.logger?.info("First request: \(records.first?.requestTags ?? [])")
        
        return response
    }
}

