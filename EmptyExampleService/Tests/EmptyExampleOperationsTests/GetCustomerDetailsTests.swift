//
// GetCustomerDetailsTests.swift
// EmptyExampleOperationsTests
//

import XCTest
@testable import EmptyExampleOperations
import EmptyExampleModel

class GetCustomerDetailsTests: XCTestCase {

    func testGetCustomerDetails() {
        let input = GetCustomerDetailsRequest.__default
        let operationsContext = createOperationsContext()
    
        XCTAssertEqual(try operationsContext.handleGetCustomerDetails(input: input), CustomerAttributes.__default)
    }

    static var allTests = [
        ("testGetCustomerDetails", testGetCustomerDetails),
    ]
}
