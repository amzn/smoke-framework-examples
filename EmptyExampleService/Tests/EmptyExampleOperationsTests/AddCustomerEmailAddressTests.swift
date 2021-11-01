//
// AddCustomerEmailAddressTests.swift
// EmptyExampleOperationsTests
//

import XCTest
@testable import EmptyExampleOperations
import EmptyExampleModel

class AddCustomerEmailAddressTests: XCTestCase {

    func testAddCustomerEmailAddress() throws {
        let input = AddCustomerEmailAddressRequest.__default
        let operationsContext = createOperationsContext()
    
        let response = try operationsContext.handleAddCustomerEmailAddress(input: input)
        XCTAssertEqual(response, CustomerEmailAddressIdentity.__default)
    }
}
