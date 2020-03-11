//
// CreateCustomerPutTests.swift
// EmptyExampleOperationsTests
//

import XCTest
@testable import EmptyExampleOperations
import EmptyExampleModel

class CreateCustomerPutTests: XCTestCase {

    func testCreateCustomerPut() {
    let input = CreateCustomerRequest.__default
    let operationsContext = createOperationsContext()
    
    XCTAssertEqual(try handleCreateCustomerPut(input: input, context: operationsContext),
    CreateCustomerPut200Response.__default)
    }

    static var allTests = [
        ("testCreateCustomerPut", testCreateCustomerPut),
    ]
}
