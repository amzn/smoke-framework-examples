//
// AddCustomerEmailAddressTests.swift
// EmptyExampleOperationsTests
//

import XCTest
@testable import EmptyExampleOperations
import EmptyExampleModel

class AddCustomerEmailAddressTests: XCTestCase {

    func testAddCustomerEmailAddress() {
        let input = AddCustomerEmailAddressRequest.__default
        let operationsContext = createOperationsContext()
    
        XCTAssertEqual(try operationsContext.handleAddCustomerEmailAddress(input: input), CustomerEmailAddressIdentity.__default)
    }

    static var allTests = [
        ("testAddCustomerEmailAddress", testAddCustomerEmailAddress),
    ]
}
