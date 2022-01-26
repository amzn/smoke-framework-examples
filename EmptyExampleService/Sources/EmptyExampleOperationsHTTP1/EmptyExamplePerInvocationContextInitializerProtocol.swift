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
public protocol EmptyExamplePerInvocationContextInitializerProtocol: StandardJSONSmokeAsyncServerPerInvocationContextInitializer
where ContextType == EmptyExampleOperationsContext, OperationIdentifer == EmptyExampleModelOperations {
    init(eventLoopGroup: EventLoopGroup) async throws
}

public extension EmptyExamplePerInvocationContextInitializerProtocol {
    // specify how to initalize the server with operations
    var operationsInitializer: OperationsInitializerType {
        return EmptyExampleModelOperations.addToSmokeServer
    }

    var serverName: String {
        return "EmptyExampleService"
    }

    static func main() async throws {
        await SmokeHTTP1Server.runAsOperationServer(Self.init)
    }
}
