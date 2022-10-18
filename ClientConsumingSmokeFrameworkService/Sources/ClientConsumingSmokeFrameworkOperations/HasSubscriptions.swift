//
// HasSubscriptions.swift
// ClientConsumingSmokeFrameworkOperations
//

import Foundation
import ClientConsumingSmokeFrameworkModel
import OtherModel

/**
 Handler for the HasSubscriptions operation.

 - Parameters:
     - input: The validated HasSubscriptionsRequest object being passed to this operation.
     - context: The context provided for this operation.
 - Returns: The HasSubscriptionsResponse object to be passed back from the caller of this operation.
     Will be validated before being returned to caller.
 */
extension ClientConsumingSmokeFrameworkOperationsContext {
    public func handleHasSubscriptions(input: ClientConsumingSmokeFrameworkModel.HasSubscriptionsRequest) async throws
    -> ClientConsumingSmokeFrameworkModel.HasSubscriptionsResponse {
        let listSubscriptionsResponse = try await self.otherClient.listSubscriptions(input: ListSubscriptionsRequest())
        
        return HasSubscriptionsResponse(hasSubscriptions: !listSubscriptionsResponse.subscriptions.isEmpty)
    }
}
