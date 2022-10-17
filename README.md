<p align="center">
<a href="https://github.com/amzn/smoke-framework-examples/actions">
<img src="https://github.com/amzn/smoke-framework-examples/actions/workflows/swift.yml/badge.svg?branch=main" alt="Build - main Branch">
</a>
<img src="https://img.shields.io/badge/os-linux-green.svg?style=flat" alt="Linux">
<a href="http://swift.org">
<img src="https://img.shields.io/badge/swift-5.7-orange.svg?style=flat" alt="Swift 5.7 Compatible">
</a>
<a href="https://gitter.im/SmokeServerSide">
<img src="https://img.shields.io/badge/chat-on%20gitter-ee115e.svg?style=flat" alt="Join the Smoke Server Side community on gitter">
</a>
<img src="https://img.shields.io/badge/license-Apache2-blue.svg?style=flat" alt="Apache 2">
</p>

# SmokeFrameworkExamples

Sample services showing the usage of the [SmokeFramework](https://github.com/amzn/smoke-framework) and related libraries.

## EmptyExampleService

An example of a service as it is generated using [SmokeFrameworkApplicationGenerate](https://github.com/amzn/smoke-framework-application-generate)
with the command-

```bash
swift run -c release SmokeFrameworkApplicationGenerate \
  --base-file-path ${workspaceRoot}/smoke-framework-examples/EmptyExampleService
```

## PersistenceExampleService

An example of a service using [SmokeDynamoDb](https://github.com/amzn/smoke-dynamodb) to store and retrieve data.
Initially generated using [SmokeFrameworkApplicationGenerate](https://github.com/amzn/smoke-framework-application-generate)
with the command-

```bash
swift run -c release SmokeFrameworkApplicationGenerate \
  --base-file-path ${workspaceRoot}/smoke-framework-examples/PersistenceExampleService \
```

## NoExistentialTypesExampleService

A variant of `PersistenceExampleService` that uses a generic context. This will mean that at runtime calls from operation
handlers to the DynamoDB table in the context will directly use the concrete `AWSDynamoDBCompositePrimaryKeyTable`
type rather than first using an existential type of the `DynamoDBCompositePrimaryKeyTable` protocol (an additional layer of redirection).

## OtherServiceModel

A Swift package wrapper around an Open API 3.0 model. Allows this model to be used by codegen SwiftPM plugins in conjunction with a consuming package.

## OtherServiceSwiftClient

An example of a Swift Client created for an API Gateway-hosted API. Uses the Open API 3.0 model specified in `OtherServiceModel`.

## ClientConsumingSmokeFrameworkService

An example of a smoke-framework-based service that uses the `OtherServiceSwiftClient` in one of its operations.
 
## License

This library is licensed under the Apache 2.0 License.
