// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PersistenceExample",
    platforms: [
      .macOS(.v10_15), .iOS(.v10)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "PersistenceExampleModel",
            targets: ["PersistenceExampleModel"]),
        .library(
            name: "PersistenceExampleClient",
            targets: ["PersistenceExampleClient"]),
        .library(
            name: "PersistenceExampleOperations",
            targets: ["PersistenceExampleOperations"]),
        .library(
            name: "PersistenceExampleOperationsHTTP1",
            targets: ["PersistenceExampleOperationsHTTP1"]),
        .executable(
            name: "PersistenceExampleService",
            targets: ["PersistenceExampleService"]),
        ],
    dependencies: [
        .package(url: "https://github.com/amzn/smoke-framework.git", from: "2.7.0"),
        .package(url: "https://github.com/amzn/smoke-aws-credentials.git", from: "2.0.0"),
        .package(url: "https://github.com/amzn/smoke-aws.git", from: "2.0.0"),
        .package(url: "https://github.com/amzn/smoke-dynamodb.git", from: "3.0.0-alpha.7"),
        ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "PersistenceExampleModel", dependencies: [
                .product(name: "SmokeOperations", package: "smoke-framework"),
            ]),
        .target(
            name: "PersistenceExampleOperations", dependencies: [
                .target(name: "PersistenceExampleModel"),
                .product(name: "SmokeDynamoDB", package: "smoke-dynamodb"),
            ]),
        .target(
            name: "PersistenceExampleOperationsHTTP1", dependencies: [
                .target(name: "PersistenceExampleOperations"),
                .product(name: "SmokeOperationsHTTP1", package: "smoke-framework"),
                .product(name: "SmokeOperationsHTTP1Server", package: "smoke-framework"),
            ]),
        .target(
            name: "PersistenceExampleClient", dependencies: [
                .target(name: "PersistenceExampleModel"),
                .product(name: "SmokeOperationsHTTP1", package: "smoke-framework"),
                .product(name: "SmokeAWSHttp", package: "smoke-aws"),
            ]),
        .executableTarget(
            name: "PersistenceExampleService", dependencies: [
                .target(name: "PersistenceExampleOperationsHTTP1"),
                .product(name: "SmokeAWSCredentials", package: "smoke-aws-credentials"),
            ]),
        .testTarget(
            name: "PersistenceExampleOperationsTests", dependencies: [
                .target(name: "PersistenceExampleOperations"),
            ]),
        ],
        swiftLanguageVersions: [.v5]
)
