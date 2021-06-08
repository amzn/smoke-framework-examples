//
// PersistenceExamplePerInvocationContextInitializerProtocol.swift
// PersistenceExampleOperationsHTTP1
//

import PersistenceExampleModel
import PersistenceExampleOperations
import SmokeOperationsHTTP1Server
            
/**
 Convenience protocol for the initialization of PersistenceExampleService.
 */
public protocol PersistenceExamplePerInvocationContextInitializerProtocol: StandardJSONSmokeServerPerInvocationContextInitializer
where ContextType == PersistenceExampleOperationsContext, OperationIdentifer == PersistenceExampleModelOperations {

}

public extension PersistenceExamplePerInvocationContextInitializerProtocol {
    // specify how to initalize the server with operations
    var operationsInitializer: OperationsInitializerType {
        return PersistenceExampleModelOperations.addToSmokeServer
    }

    var serverName: String {
        return "PersistenceExampleService"
    }
}
