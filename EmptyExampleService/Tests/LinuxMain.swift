//
// LinuxMain.swift
//

import XCTest
@testable import EmptyExampleOperationsTests

XCTMain([
    testCase(AddCustomerEmailAddressTests.allTests),
    testCase(CreateCustomerPutTests.allTests),
    testCase(GetCustomerDetailsTests.allTests),
    testCase(ListCustomersGetTests.allTests),
])
