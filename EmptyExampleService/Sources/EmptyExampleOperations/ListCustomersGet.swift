//
// ListCustomersGet.swift
// EmptyExampleOperations
//

import Foundation
import EmptyExampleModel

/**
 Handler for the ListCustomersGet operation.

 - Parameters:
     - input: The validated ListCustomersGetRequest object being passed to this operation.
     - context: The context provided for this operation.
 - Returns: The ListCustomersResponse object to be passed back from the caller of this operation.
     Will be validated before being returned to caller.
 - Throws: unknownResource.
 */
public func handleListCustomersGet(
        input: EmptyExampleModel.ListCustomersGetRequest,
        context: EmptyExampleOperationsContext) throws -> EmptyExampleModel.ListCustomersResponse {
    return ListCustomersResponse.__default
}
