//
// ListCustomersGetTests.swift
// EmptyExampleOperationsTests
//

import XCTest
@testable import EmptyExampleOperations
import EmptyExampleModel

class ListCustomersGetTests: XCTestCase {

    func testListCustomersGet() {
        let input = ListCustomersGetRequest.__default
        let operationsContext = createOperationsContext()
    
        XCTAssertEqual(try operationsContext.handleListCustomersGet(input: input), ListCustomersResponse.__default)
    }

    static var allTests = [
        ("testListCustomersGet", testListCustomersGet),
    ]
}
