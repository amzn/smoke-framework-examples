//
// EmptyExamplePerInvocationContextInitializerProtocol.swift
// EmptyExampleOperationsHTTP1
//

import EmptyExampleModel
import EmptyExampleOperations
import SmokeOperationsHTTP1Server
            
/**
 Convenience protocol for the initialization of EmptyExampleService.
 */
public protocol EmptyExamplePerInvocationContextInitializerProtocol: StandardJSONSmokeServerPerInvocationContextInitializer
where ContextType == EmptyExampleOperationsContext, OperationIdentifer == EmptyExampleModelOperations {

}

public extension EmptyExamplePerInvocationContextInitializerProtocol {
    // specify how to initalize the server with operations
    var operationsInitializer: OperationsInitializerType {
        return EmptyExampleModelOperations.addToSmokeServer
    }

    var serverName: String {
        return "EmptyExampleService"
    }
}
