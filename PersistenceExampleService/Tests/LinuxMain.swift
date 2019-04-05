//
// LinuxMain.swift
//

import XCTest
@testable import PersistenceExampleOperationsTests

XCTMain([
    testCase(AddCustomerEmailAddressTests.allTests),
    testCase(CreateCustomerPutTests.allTests),
    testCase(GetCustomerDetailsTests.allTests),
    testCase(ListCustomersGetTests.allTests),
])
