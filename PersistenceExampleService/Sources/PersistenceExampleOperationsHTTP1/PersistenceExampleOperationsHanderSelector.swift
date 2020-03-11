// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
// -- Generated Code; do not edit --
//
// PersistenceExampleOperationsHanderSelector.swift
// PersistenceExampleOperationsHTTP1
//

import Foundation
import SmokeOperationsHTTP1
import PersistenceExampleModel
import PersistenceExampleOperations
import SmokeOperations

extension PersistenceExampleModelOperations: OperationIdentity {}

public typealias HandlerSelectorType =
    StandardSmokeHTTP1HandlerSelector<PersistenceExampleOperationsContext, PersistenceExampleOperationDelegate,
                                      PersistenceExampleModelOperations>

public func createHandlerSelector() -> HandlerSelectorType {
    var newHandler = HandlerSelectorType(defaultOperationDelegate: JSONPayloadHTTP1OperationDelegate())
    
    newHandler.addHandlerForOperation(.addCustomerEmailAddress, httpMethod: .PUT,
                                      operation: handleAddCustomerEmailAddress,
                                      allowedErrors: [(PersistenceExampleErrorTypes.customerEmailAddressLimitExceeded, 400), (PersistenceExampleErrorTypes.customerEmailAddressAlreadyExists, 400), (PersistenceExampleErrorTypes.unknownResource, 404), (PersistenceExampleErrorTypes.concurrency, 409)])
    
    newHandler.addHandlerForOperation(.createCustomerPut, httpMethod: .PUT,
                                      operation: handleCreateCustomerPut,
                                      allowedErrors: [(PersistenceExampleErrorTypes.unknownResource, 404)])
    
    newHandler.addHandlerForOperation(.getCustomerDetails, httpMethod: .GET,
                                      operation: handleGetCustomerDetails,
                                      allowedErrors: [(PersistenceExampleErrorTypes.unknownResource, 404)])
    
    newHandler.addHandlerForOperation(.listCustomersGet, httpMethod: .GET,
                                      operation: handleListCustomersGet,
                                      allowedErrors: [(PersistenceExampleErrorTypes.unknownResource, 404)])
    return newHandler
}
