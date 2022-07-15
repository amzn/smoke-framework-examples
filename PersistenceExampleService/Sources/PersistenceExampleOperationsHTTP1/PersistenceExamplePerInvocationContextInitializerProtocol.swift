//
// PersistenceExamplePerInvocationContextInitializerProtocol.swift
// PersistenceExampleOperationsHTTP1
//

import PersistenceExampleModel
import PersistenceExampleOperations
import NIO
import SmokeHTTP1
import SmokeOperationsHTTP1JSON
import SmokeOperationsHTTP1Server
            
/**
 Convenience protocol for the initialization of PersistenceExampleService.
 */
public protocol PersistenceExamplePerInvocationContextInitializerProtocol: JSONSmokeMiddlewareServerPerInvocationContextInitializer
where ContextType == PersistenceExampleOperationsContext, OperationIdentifer == PersistenceExampleModelOperations {
    init(eventLoopGroup: EventLoopGroup) async throws
}

public extension PersistenceExamplePerInvocationContextInitializerProtocol {
    // specify how to initalize the server with operations
    var operationsInitializer: OperationsInitializerType {
        return PersistenceExampleModelOperations.addToSmokeServer
    }

    var serverName: String {
        return "PersistenceExampleService"
    }

    static func main() async throws {
        await SmokeHTTP1Server.runAsOperationServer(Self.init)
    }
}
