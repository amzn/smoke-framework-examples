// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
// -- Generated Code; do not edit --
//
// EmptyExampleOperationsHanderSelector.swift
// EmptyExampleOperationsHTTP1
//

import Foundation
import SmokeOperationsHTTP1
import SmokeOperationsHTTP1Server
import EmptyExampleModel
import EmptyExampleOperations
import SmokeOperations

extension EmptyExampleModelOperations: OperationIdentity {}

public typealias HandlerSelectorType =
    StandardSmokeHTTP1HandlerSelector<EmptyExampleOperationsContext, EmptyExampleOperationDelegate,
                                      EmptyExampleModelOperations>

public func createHandlerSelector() -> HandlerSelectorType {
    var newHandler = HandlerSelectorType(defaultOperationDelegate: JSONPayloadHTTP1OperationDelegate())
    
    newHandler.addHandlerForOperation(.addCustomerEmailAddress, httpMethod: .PUT,
                                      operation: handleAddCustomerEmailAddress,
                                      allowedErrors: [(EmptyExampleErrorTypes.customerEmailAddressLimitExceeded, 400), (EmptyExampleErrorTypes.customerEmailAddressAlreadyExists, 400), (EmptyExampleErrorTypes.unknownResource, 404), (EmptyExampleErrorTypes.concurrency, 409)])
    
    newHandler.addHandlerForOperation(.createCustomerPut, httpMethod: .PUT,
                                      operation: handleCreateCustomerPut,
                                      allowedErrors: [(EmptyExampleErrorTypes.unknownResource, 404)])
    
    newHandler.addHandlerForOperation(.getCustomerDetails, httpMethod: .GET,
                                      operation: handleGetCustomerDetails,
                                      allowedErrors: [(EmptyExampleErrorTypes.unknownResource, 404)])
    
    newHandler.addHandlerForOperation(.listCustomersGet, httpMethod: .GET,
                                      operation: handleListCustomersGet,
                                      allowedErrors: [(EmptyExampleErrorTypes.unknownResource, 404)])
    return newHandler
}
