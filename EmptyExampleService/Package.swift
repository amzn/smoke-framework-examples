// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EmptyExample",
    platforms: [
      .macOS(.v10_12), .iOS(.v10)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "EmptyExampleModel",
            targets: ["EmptyExampleModel"]),
        .library(
            name: "EmptyExampleClient",
            targets: ["EmptyExampleClient"]),
        .library(
            name: "EmptyExampleOperations",
            targets: ["EmptyExampleOperations"]),
        .library(
            name: "EmptyExampleOperationsHTTP1",
            targets: ["EmptyExampleOperationsHTTP1"]),
        .executable(
            name: "EmptyExampleService",
            targets: ["EmptyExampleService"]),
        ],
    dependencies: [
        .package(url: "https://github.com/amzn/smoke-framework.git", .branch("1_x_compatible_server")),
        .package(url: "https://github.com/amzn/smoke-aws-credentials.git", from: "2.0.0-alpha.2"),
        .package(url: "https://github.com/amzn/smoke-aws.git", from: "2.0.0-alpha.4"),
        ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "EmptyExampleModel",
            dependencies: ["SmokeOperations"]),
        .target(
            name: "EmptyExampleOperations",
            dependencies: ["EmptyExampleModel"]),
        .target(
            name: "EmptyExampleOperationsHTTP1",
            dependencies: ["EmptyExampleOperations", "SmokeOperationsHTTP1"]),
        .target(
            name: "EmptyExampleClient",
            dependencies: ["EmptyExampleModel", "SmokeOperationsHTTP1", "SmokeAWSHttp"]),
        .target(
            name: "EmptyExampleService",
            dependencies: ["EmptyExampleOperationsHTTP1", "SmokeAWSCredentials"]),
        .testTarget(
            name: "EmptyExampleOperationsTests",
            dependencies: ["EmptyExampleOperations"]),
        ],
        swiftLanguageVersions: [.v5]
)
