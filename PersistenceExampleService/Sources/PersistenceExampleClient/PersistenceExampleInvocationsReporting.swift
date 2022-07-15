// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
// swiftlint:disable type_body_length function_body_length generic_type_name cyclomatic_complexity
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
 Invocations reporting for the PersistenceExampleModel.
 */
public struct PersistenceExampleInvocationsReporting<InvocationReportingType: HTTPClientCoreInvocationReporting> {
    public let addCustomerEmailAddress: SmokeAWSHTTPClientInvocationReporting<InvocationReportingType>
    public let createCustomerPut: SmokeAWSHTTPClientInvocationReporting<InvocationReportingType>
    public let getCustomerDetails: SmokeAWSHTTPClientInvocationReporting<InvocationReportingType>
    public let listCustomersGet: SmokeAWSHTTPClientInvocationReporting<InvocationReportingType>

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
