//
// ClientConsumingSmokeFrameworkTestConfiguration.swift
// ClientConsumingSmokeFrameworkOperationsTests
//

import XCTest
@testable import ClientConsumingSmokeFrameworkOperations
import ClientConsumingSmokeFrameworkModel
import Logging
import OtherClient

struct TestVariables {
    static let logger = Logger(label: "ClientConsumingSmokeFrameworkTestConfiguration")
}

func createOperationsContext(otherClient otherClientOptional: MockOtherClient? = nil)
-> ClientConsumingSmokeFrameworkOperationsContext<MockOtherClient> {
    let otherClient = otherClientOptional ?? MockOtherClient()
    
    return ClientConsumingSmokeFrameworkOperationsContext(otherClient: otherClient,
                                                          logger: TestVariables.logger)
}
