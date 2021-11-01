//
// GetCustomerDetailsTests.swift
// EmptyExampleOperationsTests
//

import XCTest
@testable import EmptyExampleOperations
import EmptyExampleModel

class GetCustomerDetailsTests: XCTestCase {

    func testGetCustomerDetails() throws {
        let input = GetCustomerDetailsRequest.__default
        let operationsContext = createOperationsContext()
    
        let response = try operationsContext.handleGetCustomerDetails(input: input)
        XCTAssertEqual(response, CustomerAttributes.__default)
    }
}
