//
// CreateCustomerPutTests.swift
// EmptyExampleOperationsTests
//

import XCTest
@testable import EmptyExampleOperations
import EmptyExampleModel

class CreateCustomerPutTests: XCTestCase {

    func testCreateCustomerPut() throws {
        let input = CreateCustomerRequest.__default
        let operationsContext = createOperationsContext()
    
        let response = try operationsContext.handleCreateCustomerPut(input: input)
        XCTAssertEqual(response, CreateCustomerPut200Response.__default)
    }
}
