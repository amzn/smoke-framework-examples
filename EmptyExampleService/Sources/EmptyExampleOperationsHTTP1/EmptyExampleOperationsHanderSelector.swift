// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
// swiftlint:disable type_body_length function_body_length generic_type_name cyclomatic_complexity
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
    
    let allowedErrorsForAddCustomerEmailAddress: [(EmptyExampleErrorTypes, Int)] = [(.customerEmailAddressLimitExceeded, 400), (.customerEmailAddressAlreadyExists, 400), (.unknownResource, 404), (.concurrency, 409)]
    selector.addHandlerForOperationProvider(.addCustomerEmailAddress, httpMethod: .PUT,
                                            operationProvider: EmptyExampleOperationsContext.handleAddCustomerEmailAddress,
                                            allowedErrors: allowedErrorsForAddCustomerEmailAddress)
    
    let allowedErrorsForCreateCustomerPut: [(EmptyExampleErrorTypes, Int)] = [(.unknownResource, 404)]
    selector.addHandlerForOperationProvider(.createCustomerPut, httpMethod: .PUT,
                                            operationProvider: EmptyExampleOperationsContext.handleCreateCustomerPut,
                                            allowedErrors: allowedErrorsForCreateCustomerPut)
    
    let allowedErrorsForGetCustomerDetails: [(EmptyExampleErrorTypes, Int)] = [(.unknownResource, 404)]
    selector.addHandlerForOperationProvider(.getCustomerDetails, httpMethod: .GET,
                                            operationProvider: EmptyExampleOperationsContext.handleGetCustomerDetails,
                                            allowedErrors: allowedErrorsForGetCustomerDetails)
    
    let allowedErrorsForListCustomersGet: [(EmptyExampleErrorTypes, Int)] = [(.unknownResource, 404)]
    selector.addHandlerForOperationProvider(.listCustomersGet, httpMethod: .GET,
                                            operationProvider: EmptyExampleOperationsContext.handleListCustomersGet,
                                            allowedErrors: allowedErrorsForListCustomersGet)
}
