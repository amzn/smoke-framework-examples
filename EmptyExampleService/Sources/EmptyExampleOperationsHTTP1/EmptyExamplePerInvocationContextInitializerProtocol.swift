//
// EmptyExamplePerInvocationContextInitializerProtocol.swift
// EmptyExampleOperationsHTTP1
//

import EmptyExampleModel
import EmptyExampleOperations
import NIO
import SmokeHTTP1
import SmokeOperationsHTTP1Server
            
/**
 Convenience protocol for the initialization of EmptyExampleService.
 */
public protocol EmptyExamplePerInvocationContextInitializerProtocol: StandardJSONSmokeServerPerInvocationContextInitializer
where ContextType == EmptyExampleOperationsContext, OperationIdentifer == EmptyExampleModelOperations {
    init(eventLoopGroup: EventLoopGroup) throws
}

public extension EmptyExamplePerInvocationContextInitializerProtocol {
    // specify how to initalize the server with operations
    var operationsInitializer: OperationsInitializerType {
        return EmptyExampleModelOperations.addToSmokeServer
    }

    var serverName: String {
        return "EmptyExampleService"
    }

    static func main() throws {
        SmokeHTTP1Server.runAsOperationServer(Self.init)
    }
}
