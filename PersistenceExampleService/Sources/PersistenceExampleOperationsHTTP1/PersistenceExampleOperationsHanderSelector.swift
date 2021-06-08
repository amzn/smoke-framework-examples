// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
// swiftlint:disable type_body_length function_body_length generic_type_name cyclomatic_complexity
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

public extension PersistenceExampleModelOperations {
    static func addToSmokeServer<SelectorType: SmokeHTTP1HandlerSelector>(selector: inout SelectorType)
        where SelectorType.ContextType == PersistenceExampleOperationsContext,
        SelectorType.OperationIdentifer == PersistenceExampleModelOperations {
        
        let allowedErrorsForAddCustomerEmailAddress: [(PersistenceExampleErrorTypes, Int)] = [(.customerEmailAddressLimitExceeded, 400), (.customerEmailAddressAlreadyExists, 400), (.unknownResource, 404), (.concurrency, 409)]
        selector.addHandlerForOperationProvider(.addCustomerEmailAddress, httpMethod: .PUT,
                                                operationProvider: PersistenceExampleOperationsContext.handleAddCustomerEmailAddress,
                                                allowedErrors: allowedErrorsForAddCustomerEmailAddress)
        
        let allowedErrorsForCreateCustomerPut: [(PersistenceExampleErrorTypes, Int)] = [(.unknownResource, 404)]
        selector.addHandlerForOperationProvider(.createCustomerPut, httpMethod: .PUT,
                                                operationProvider: PersistenceExampleOperationsContext.handleCreateCustomerPut,
                                                allowedErrors: allowedErrorsForCreateCustomerPut)
        
        let allowedErrorsForGetCustomerDetails: [(PersistenceExampleErrorTypes, Int)] = [(.unknownResource, 404)]
        selector.addHandlerForOperationProvider(.getCustomerDetails, httpMethod: .GET,
                                                operationProvider: PersistenceExampleOperationsContext.handleGetCustomerDetails,
                                                allowedErrors: allowedErrorsForGetCustomerDetails)
        
        let allowedErrorsForListCustomersGet: [(PersistenceExampleErrorTypes, Int)] = [(.unknownResource, 404)]
        selector.addHandlerForOperationProvider(.listCustomersGet, httpMethod: .GET,
                                                operationProvider: PersistenceExampleOperationsContext.handleListCustomersGet,
                                                allowedErrors: allowedErrorsForListCustomersGet)
    }
}
