//
// HasSubscriptionsTests.swift
// ClientConsumingSmokeFrameworkOperationsTests
//

import XCTest
@testable import ClientConsumingSmokeFrameworkOperations
import ClientConsumingSmokeFrameworkModel
import OtherModel
import OtherClient

class HasSubscriptionsTests: XCTestCase {

    func testWithoutSubscriptions() async throws {
        func listSubscriptions(input: OtherModel.ListSubscriptionsRequest) async throws
        -> OtherModel.ListSubscriptionsResponse {
            return ListSubscriptionsResponse(subscriptions: [])
        }
        
        let otherClient = MockOtherClient(listSubscriptions: listSubscriptions)
        
        let input = HasSubscriptionsRequest.__default
        let operationsContext = createOperationsContext(otherClient: otherClient)
    
        let response = try await operationsContext.handleHasSubscriptions(input: input)
        XCTAssertFalse(response.hasSubscriptions)
    }
    
    func testWithSubscriptions() async throws {
        func listSubscriptions(input: OtherModel.ListSubscriptionsRequest) async throws
        -> OtherModel.ListSubscriptionsResponse {
            let subscription = Subscription(description: "The only subscription", id: "xx1")
            return ListSubscriptionsResponse(subscriptions: [subscription])
        }
        
        let otherClient = MockOtherClient(listSubscriptions: listSubscriptions)
        
        let input = HasSubscriptionsRequest.__default
        let operationsContext = createOperationsContext(otherClient: otherClient)
    
        let response = try await operationsContext.handleHasSubscriptions(input: input)
        XCTAssertTrue(response.hasSubscriptions)
    }
}
