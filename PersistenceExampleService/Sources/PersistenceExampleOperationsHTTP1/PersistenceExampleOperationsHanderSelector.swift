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
import SmokeOperationsHTTP1JSON

extension PersistenceExampleModelOperations: OperationIdentity {}

public extension PersistenceExampleModelOperations {
    static func addToSmokeServer<DelegateType>(operationsStack: inout SmokeJSONHTTP1OperationsStack<DelegateType>)
        where DelegateType.ContextType == PersistenceExampleOperationsContext,
        DelegateType.OperationIdentifer == PersistenceExampleModelOperations {
        
        let allowedErrorsForAddCustomerEmailAddress: [(PersistenceExampleErrorTypes, Int)] = [(.customerEmailAddressLimitExceeded, 400), (.customerEmailAddressAlreadyExists, 400), (.unknownResource, 404), (.concurrency, 409)]
        operationsStack.addHandlerForOperationProvider(.addCustomerEmailAddress, httpMethod: .PUT,
                                                operationProvider: PersistenceExampleOperationsContext.handleAddCustomerEmailAddress,
                                                allowedErrors: allowedErrorsForAddCustomerEmailAddress)
        
        let allowedErrorsForCreateCustomerPut: [(PersistenceExampleErrorTypes, Int)] = [(.unknownResource, 404)]
        operationsStack.addHandlerForOperationProvider(.createCustomerPut, httpMethod: .PUT,
                                                operationProvider: PersistenceExampleOperationsContext.handleCreateCustomerPut,
                                                allowedErrors: allowedErrorsForCreateCustomerPut)
        
        let allowedErrorsForGetCustomerDetails: [(PersistenceExampleErrorTypes, Int)] = [(.unknownResource, 404)]
        operationsStack.addHandlerForOperationProvider(.getCustomerDetails, httpMethod: .GET,
                                                operationProvider: PersistenceExampleOperationsContext.handleGetCustomerDetails,
                                                allowedErrors: allowedErrorsForGetCustomerDetails)
        
        let allowedErrorsForListCustomersGet: [(PersistenceExampleErrorTypes, Int)] = [(.unknownResource, 404)]
        operationsStack.addHandlerForOperationProvider(.listCustomersGet, httpMethod: .GET,
                                                operationProvider: PersistenceExampleOperationsContext.handleListCustomersGet,
                                                allowedErrors: allowedErrorsForListCustomersGet)
    }
}
