// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
// -- Generated Code; do not edit --
//
// PersistenceExampleOperationsHanderSelector.swift
// PersistenceExampleOperationsHTTP1
//

import Foundation
import PersistenceExampleModel
import PersistenceExampleOperations
import SmokeOperations
import SmokeOperationsHTTP1

extension PersistenceExampleModelOperations: OperationIdentity {}

public func addOperations<SelectorType: SmokeHTTP1HandlerSelector>(selector: inout SelectorType)
    where SelectorType.ContextType == PersistenceExampleOperationsContext,
    SelectorType.OperationIdentifer == PersistenceExampleModelOperations {
    
    selector.addHandlerForOperation(.addCustomerEmailAddress, httpMethod: .PUT,
                                    operation: handleAddCustomerEmailAddress,
                                    allowedErrors: [(PersistenceExampleErrorTypes.customerEmailAddressLimitExceeded, 400), (PersistenceExampleErrorTypes.customerEmailAddressAlreadyExists, 400), (PersistenceExampleErrorTypes.unknownResource, 404), (PersistenceExampleErrorTypes.concurrency, 409)])
    
    selector.addHandlerForOperation(.createCustomerPut, httpMethod: .PUT,
                                    operation: handleCreateCustomerPut,
                                    allowedErrors: [(PersistenceExampleErrorTypes.unknownResource, 404)])
    
    selector.addHandlerForOperation(.getCustomerDetails, httpMethod: .GET,
                                    operation: handleGetCustomerDetails,
                                    allowedErrors: [(PersistenceExampleErrorTypes.unknownResource, 404)])
    
    selector.addHandlerForOperation(.listCustomersGet, httpMethod: .GET,
                                    operation: handleListCustomersGet,
                                    allowedErrors: [(PersistenceExampleErrorTypes.unknownResource, 404)])
}
