//
// EmptyExamplePerInvocationContextInitializer.swift
// EmptyExampleService
//

import EmptyExampleModel
import EmptyExampleOperations
import EmptyExampleOperationsHTTP1
import SmokeOperationsHTTP1
import SmokeOperationsHTTP1Server
import SmokeAWSCore
import NIO

typealias EmptyExampleOperationDelegate = JSONPayloadHTTP1OperationDelegate<SmokeInvocationTraceContext>

/**
 Initializer for the EmptyExampleService.
 */
struct EmptyExamplePerInvocationContextInitializer: SmokeServerPerInvocationContextInitializer {
    typealias SelectorType =
        StandardSmokeHTTP1HandlerSelector<EmptyExampleOperationsContext, EmptyExampleOperationDelegate,
                                          EmptyExampleModelOperations>

    let handlerSelector: SelectorType

    // TODO: Add properties to be accessed by the operation handlers

    /**
     On application startup.
     */
    init(eventLoop: EventLoop) throws {
        CloudwatchStandardErrorLogger.enableLogging()

        var selector = SelectorType(defaultOperationDelegate: JSONPayloadHTTP1OperationDelegate())
        addOperations(selector: &selector)

        self.handlerSelector = selector
    }

    /**
     On invocation.
    */
    public func getInvocationContext(
        invocationReporting: SmokeServerInvocationReporting<SmokeInvocationTraceContext>) -> EmptyExampleOperationsContext {
        return EmptyExampleOperationsContext(logger: invocationReporting.logger)
    }

    /**
     On application shutdown.
    */
    func onShutdown() throws {
        
    }
}
