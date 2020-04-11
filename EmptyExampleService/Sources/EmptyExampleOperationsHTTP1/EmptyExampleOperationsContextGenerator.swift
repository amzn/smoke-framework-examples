//
// EmptyExampleOperationsContextGenerator.swift
// EmptyExampleOperationsHTTP1
//

import Foundation
import EmptyExampleOperations
import SmokeOperations
import SmokeOperationsHTTP1Server
import Logging

/**
 Per-invocation generator for the context to be passed to each of the EmptyExample operations.
 */
public struct EmptyExampleOperationsContextGenerator {
    // TODO: Add properties to be accessed by the operation handlers

    public init() {
    }

    public func get(invocationReporting: SmokeServerInvocationReporting<SmokeInvocationTraceContext>) -> EmptyExampleOperationsContext {
        return EmptyExampleOperationsContext(logger: invocationReporting.logger)
    }
}
