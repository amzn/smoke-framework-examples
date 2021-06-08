<p align="center">
<a href="https://travis-ci.com/amzn/smoke-framework-examples">
<img src="https://travis-ci.com/amzn/smoke-framework-examples.svg?branch=smoke-framework-examples-1.x" alt="Build - smoke-framework-examples-1.x Branch">
</a>
<img src="https://img.shields.io/badge/os-linux-green.svg?style=flat" alt="Linux">
<a href="http://swift.org">
<img src="https://img.shields.io/badge/swift-5.4-orange.svg?style=flat" alt="Swift 5.4 Compatible">
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

## License

This library is licensed under the Apache 2.0 License.
