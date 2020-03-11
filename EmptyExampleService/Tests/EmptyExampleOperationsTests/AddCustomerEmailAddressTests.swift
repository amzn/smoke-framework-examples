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
    
    XCTAssertEqual(try handleAddCustomerEmailAddress(input: input, context: operationsContext),
    CustomerEmailAddressIdentity.__default)
    }

    static var allTests = [
        ("testAddCustomerEmailAddress", testAddCustomerEmailAddress),
    ]
}
