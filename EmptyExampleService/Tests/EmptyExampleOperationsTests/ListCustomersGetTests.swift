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
    
    XCTAssertEqual(try handleListCustomersGet(input: input, context: operationsContext),
    ListCustomersResponse.__default)
    }

    static var allTests = [
        ("testListCustomersGet", testListCustomersGet),
    ]
}
