// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NoExistentialTypesExample",
    platforms: [
      .macOS(.v10_15), .iOS(.v10)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "NoExistentialTypesExampleModel",
            targets: ["NoExistentialTypesExampleModel"]),
        .library(
            name: "NoExistentialTypesExampleOperations",
            targets: ["NoExistentialTypesExampleOperations"]),
        .library(
            name: "NoExistentialTypesExampleOperationsHTTP1",
            targets: ["NoExistentialTypesExampleOperationsHTTP1"]),
        .executable(
            name: "NoExistentialTypesExampleService",
            targets: ["NoExistentialTypesExampleService"]),
        ],
    dependencies: [
        .package(url: "https://github.com/amzn/smoke-framework.git", from: "2.7.0"),
        .package(url: "https://github.com/amzn/smoke-aws-credentials.git", from: "2.0.0"),
        .package(url: "https://github.com/amzn/smoke-dynamodb.git", from: "3.1.0"),
        .package(url: "https://github.com/amzn/smoke-framework-application-generate", branch: "integration_specific_context_type_names"),
        ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "NoExistentialTypesExampleModel", dependencies: [
                .product(name: "SmokeOperations", package: "smoke-framework"),
            ],
            plugins: [
                .plugin(name: "SmokeFrameworkGenerateModel", package: "smoke-framework-application-generate")
            ]),
        .target(
            name: "NoExistentialTypesExampleOperations", dependencies: [
                .target(name: "NoExistentialTypesExampleModel"),
                .product(name: "SmokeDynamoDB", package: "smoke-dynamodb"),
            ]),
        .target(
            name: "NoExistentialTypesExampleOperationsHTTP1", dependencies: [
                .target(name: "NoExistentialTypesExampleOperations"),
                .product(name: "SmokeOperationsHTTP1", package: "smoke-framework"),
                .product(name: "SmokeOperationsHTTP1Server", package: "smoke-framework"),
            ],
            plugins: [
                .plugin(name: "SmokeFrameworkGenerateHttp1", package: "smoke-framework-application-generate")
            ]),
        .executableTarget(
            name: "NoExistentialTypesExampleService", dependencies: [
                .target(name: "NoExistentialTypesExampleOperationsHTTP1"),
                .product(name: "SmokeAWSCredentials", package: "smoke-aws-credentials"),
            ]),
        .testTarget(
            name: "NoExistentialTypesExampleOperationsTests", dependencies: [
                .target(name: "NoExistentialTypesExampleOperations"),
            ]),
        ],
        swiftLanguageVersions: [.v5]
)
