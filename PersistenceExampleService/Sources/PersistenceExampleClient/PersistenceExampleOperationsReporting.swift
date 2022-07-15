// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
// swiftlint:disable type_body_length function_body_length generic_type_name cyclomatic_complexity
// -- Generated Code; do not edit --
//
// PersistenceExampleOperationsReporting.swift
// PersistenceExampleClient
//

import Foundation
import SmokeAWSCore
import PersistenceExampleModel
import SmokeOperations

/**
 Operation reporting for the PersistenceExampleModel.
 */
public struct PersistenceExampleOperationsReporting {
    public let addCustomerEmailAddress: StandardSmokeAWSOperationReporting<PersistenceExampleModelOperations>
    public let createCustomerPut: StandardSmokeAWSOperationReporting<PersistenceExampleModelOperations>
    public let getCustomerDetails: StandardSmokeAWSOperationReporting<PersistenceExampleModelOperations>
    public let listCustomersGet: StandardSmokeAWSOperationReporting<PersistenceExampleModelOperations>

    public init(clientName: String, reportingConfiguration: SmokeAWSClientReportingConfiguration<PersistenceExampleModelOperations>) {
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
