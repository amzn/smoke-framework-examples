// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length line_length identifier_name type_name vertical_parameter_alignment
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
    let addCustomerEmailAddress: StandardSmokeAWSOperationReporting<PersistenceExampleModelOperations>
    let createCustomerPut: StandardSmokeAWSOperationReporting<PersistenceExampleModelOperations>
    let getCustomerDetails: StandardSmokeAWSOperationReporting<PersistenceExampleModelOperations>
    let listCustomersGet: StandardSmokeAWSOperationReporting<PersistenceExampleModelOperations>

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
