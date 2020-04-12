// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
// -- Generated Code; do not edit --
//
// PersistenceExampleInvocationsReporting.swift
// PersistenceExampleClient
//

import Foundation
import SmokeHTTPClient
import SmokeAWSHttp
import PersistenceExampleModel
import SmokeOperations

/**
 Operation reporting for the PersistenceExampleModel.
 */
public struct PersistenceExampleInvocationsReporting<InvocationReportingType: HTTPClientCoreInvocationReporting> {
    let addCustomerEmailAddress: SmokeAWSHTTPClientInvocationReporting<InvocationReportingType>
    let createCustomerPut: SmokeAWSHTTPClientInvocationReporting<InvocationReportingType>
    let getCustomerDetails: SmokeAWSHTTPClientInvocationReporting<InvocationReportingType>
    let listCustomersGet: SmokeAWSHTTPClientInvocationReporting<InvocationReportingType>

    public init(reporting: InvocationReportingType, operationsReporting: PersistenceExampleOperationsReporting) {
        self.addCustomerEmailAddress = SmokeAWSHTTPClientInvocationReporting(smokeAWSInvocationReporting: reporting,
            smokeAWSOperationReporting: operationsReporting.addCustomerEmailAddress)
        self.createCustomerPut = SmokeAWSHTTPClientInvocationReporting(smokeAWSInvocationReporting: reporting,
            smokeAWSOperationReporting: operationsReporting.createCustomerPut)
        self.getCustomerDetails = SmokeAWSHTTPClientInvocationReporting(smokeAWSInvocationReporting: reporting,
            smokeAWSOperationReporting: operationsReporting.getCustomerDetails)
        self.listCustomersGet = SmokeAWSHTTPClientInvocationReporting(smokeAWSInvocationReporting: reporting,
            smokeAWSOperationReporting: operationsReporting.listCustomersGet)
    }
}
