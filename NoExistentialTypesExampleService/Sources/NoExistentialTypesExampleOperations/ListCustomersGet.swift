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
// ListCustomersGet.swift
// NoExistentialTypesExampleOperations
//

import Foundation
import NoExistentialTypesExampleModel

/**
 Handler for the ListCustomersGet operation.

 - Parameters:
     - input: The validated ListCustomersGetRequest object being passed to this operation.
     - context: The context provided for this operation.
 - Returns: The ListCustomersResponse object to be passed back from the caller of this operation.
     Will be validated before being returned to caller.
 - Throws: unknownResource.
 */
extension NoExistentialTypesExampleOperationsContext {
    public func handleListCustomersGet(input: NoExistentialTypesExampleModel.ListCustomersGetRequest) async throws
    -> NoExistentialTypesExampleModel.ListCustomersResponse {
        // TODO: Implement secondary index to handle listing customers.
        return ListCustomersResponse.__default
    }
}
