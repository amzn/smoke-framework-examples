// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
// -- Generated Code; do not edit --
//
// EmptyExampleOperationsHanderSelector.swift
// EmptyExampleOperationsHTTP1
//

import Foundation
import EmptyExampleModel
import EmptyExampleOperations
import SmokeOperations
import SmokeOperationsHTTP1

extension EmptyExampleModelOperations: OperationIdentity {}

public func addOperations<SelectorType: SmokeHTTP1HandlerSelector>(selector: inout SelectorType)
    where SelectorType.ContextType == EmptyExampleOperationsContext,
    SelectorType.OperationIdentifer == EmptyExampleModelOperations {
    
    selector.addHandlerForOperation(.addCustomerEmailAddress, httpMethod: .PUT,
                                    operation: handleAddCustomerEmailAddress,
                                    allowedErrors: [(EmptyExampleErrorTypes.customerEmailAddressLimitExceeded, 400), (EmptyExampleErrorTypes.customerEmailAddressAlreadyExists, 400), (EmptyExampleErrorTypes.unknownResource, 404), (EmptyExampleErrorTypes.concurrency, 409)])
    
    selector.addHandlerForOperation(.createCustomerPut, httpMethod: .PUT,
                                    operation: handleCreateCustomerPut,
                                    allowedErrors: [(EmptyExampleErrorTypes.unknownResource, 404)])
    
    selector.addHandlerForOperation(.getCustomerDetails, httpMethod: .GET,
                                    operation: handleGetCustomerDetails,
                                    allowedErrors: [(EmptyExampleErrorTypes.unknownResource, 404)])
    
    selector.addHandlerForOperation(.listCustomersGet, httpMethod: .GET,
                                    operation: handleListCustomersGet,
                                    allowedErrors: [(EmptyExampleErrorTypes.unknownResource, 404)])
}
