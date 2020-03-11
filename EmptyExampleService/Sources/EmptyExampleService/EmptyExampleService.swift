//
// EmptyExampleService.swift
// EmptyExampleService
//

import Foundation
import EmptyExampleOperationsHTTP1
import EmptyExampleOperations
import SmokeHTTP1
import SmokeOperationsHTTP1
import SmokeAWSCore
import Logging

func handleApplication() {
    CloudwatchStandardErrorLogger.enableLogging()

    let applicationLogger = Logger(label: "EmptyExample.application")

    let operationsContext = EmptyExampleOperationsContext()

    do {
        let smokeHTTP1Server = try SmokeHTTP1Server.startAsOperationServer(
            withHandlerSelector: createHandlerSelector(),
            andContext: operationsContext)

        try smokeHTTP1Server.waitUntilShutdownAndThen {
            // TODO: Close/shutdown any clients or credentials that are part
            //       of the operationsContext.
        }
    } catch {
        applicationLogger.error("Unable to start Operations Server: '\(error)'")
    }
}
