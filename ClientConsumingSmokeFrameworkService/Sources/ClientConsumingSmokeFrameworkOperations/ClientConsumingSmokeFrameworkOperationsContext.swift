//
// ClientConsumingSmokeFrameworkOperationsContext.swift
// ClientConsumingSmokeFrameworkOperations
//

import Foundation
import Logging
import OtherClient

/**
 The context to be passed to each of the ClientConsumingSmokeFramework operations.
 */
public struct ClientConsumingSmokeFrameworkOperationsContext<OtherClientType: OtherClientProtocol> {
    let otherClient: OtherClientType
    let logger: Logger

    public init(otherClient: OtherClientType,
                logger: Logger) {
        self.otherClient = otherClient
        self.logger = logger
    }
}
