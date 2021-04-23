// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
// swiftlint:disable type_body_length function_body_length generic_type_name cyclomatic_complexity
// -- Generated Code; do not edit --
//
// EmptyExampleOperationsReporting.swift
// EmptyExampleClient
//

import Foundation
import SmokeAWSCore
import EmptyExampleModel
import SmokeOperations

/**
 Operation reporting for the EmptyExampleModel.
 */
public struct EmptyExampleOperationsReporting {
    public let addCustomerEmailAddress: StandardSmokeAWSOperationReporting<EmptyExampleModelOperations>
    public let createCustomerPut: StandardSmokeAWSOperationReporting<EmptyExampleModelOperations>
    public let getCustomerDetails: StandardSmokeAWSOperationReporting<EmptyExampleModelOperations>
    public let listCustomersGet: StandardSmokeAWSOperationReporting<EmptyExampleModelOperations>

    public init(clientName: String, reportingConfiguration: SmokeAWSClientReportingConfiguration<EmptyExampleModelOperations>) {
        self.addCustomerEmailAddress = StandardSmokeAWSOperationReporting(
            clientName: clientName, operation: .addCustomerEmailAddress, configuration: reportingConfiguration)
        self.createCustomerPut = StandardSmokeAWSOperationReporting(
            clientName: clientName, operation: .createCustomerPut, configuration: reportingConfiguration)
        self.getCustomerDetails = StandardSmokeAWSOperationReporting(
            clientName: clientName, operation: .getCustomerDetails, configuration: reportingConfiguration)
        self.listCustomersGet = StandardSmokeAWSOperationReporting(
            clientName: clientName, operation: .listCustomersGet, configuration: reportingConfiguration)
    }
}
