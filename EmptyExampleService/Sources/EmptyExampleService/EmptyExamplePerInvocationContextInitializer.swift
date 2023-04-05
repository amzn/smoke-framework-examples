//
// EmptyExamplePerInvocationContextInitializer.swift
// EmptyExampleService
//

import EmptyExampleOperations
import EmptyExampleOperationsHTTP1
import SmokeOperationsHTTP1
import SmokeOperationsHTTP1Server
import SmokeAWSCore
import Logging
import NIO
            
/**
 Initializer for the EmptyExampleService.
 */
@main
struct EmptyExamplePerInvocationContextInitializer: EmptyExamplePerInvocationContextInitializerProtocol {
    let serverConfiguration: SmokeServerConfiguration<OperationIdentifer>
    
    // TODO: Add properties to be accessed by the operation handlers

    /**
     On application startup.
     */
    init(eventLoopGroup: EventLoopGroup) async throws {
        CloudwatchStandardErrorLogger.enableLogging()
        
        self.serverConfiguration = .init()

        // TODO: Add additional application initialization
    }

    /**
     On invocation.
    */
    public func getInvocationContext(requestContext: HTTPServerRequestContext<OperationIdentifer>)
    -> EmptyExampleOperationsContext {
        return EmptyExampleOperationsContext(logger: requestContext.logger ?? Logger(label: "invocation"))
    }

    /**
     On application shutdown.
    */
    func onShutdown() async throws {
        
    }
}
