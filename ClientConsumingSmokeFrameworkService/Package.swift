// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ClientConsumingSmokeFramework",
    platforms: [
      .macOS(.v10_15), .iOS(.v10)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "ClientConsumingSmokeFrameworkModel",
            targets: ["ClientConsumingSmokeFrameworkModel"]),
        .library(
            name: "ClientConsumingSmokeFrameworkOperations",
            targets: ["ClientConsumingSmokeFrameworkOperations"]),
        .library(
            name: "ClientConsumingSmokeFrameworkOperationsHTTP1",
            targets: ["ClientConsumingSmokeFrameworkOperationsHTTP1"]),
        .executable(
            name: "ClientConsumingSmokeFrameworkService",
            targets: ["ClientConsumingSmokeFrameworkService"]),
        ],
    dependencies: [
        .package(url: "https://github.com/amzn/smoke-framework.git", from: "2.7.0"),
        .package(url: "https://github.com/amzn/smoke-aws-credentials.git", from: "2.0.0"),
        .package(url: "https://github.com/amzn/smoke-aws-support.git", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
        .package(url: "https://github.com/amzn/smoke-framework-application-generate", branch: "smoke_aws_support"),
        .package(path: "../OtherServiceSwiftClient"),
        ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "ClientConsumingSmokeFrameworkModel", dependencies: [
                .product(name: "SmokeOperations", package: "smoke-framework"),
                .product(name: "Logging", package: "swift-log"),
            ],
            plugins: [
                .plugin(name: "SmokeFrameworkGenerateModel", package: "smoke-framework-application-generate")
            ]),
        .target(
            name: "ClientConsumingSmokeFrameworkOperations", dependencies: [
                .target(name: "ClientConsumingSmokeFrameworkModel"),
                .product(name: "OtherClient", package: "OtherServiceSwiftClient"),
            ]),
        .target(
            name: "ClientConsumingSmokeFrameworkOperationsHTTP1", dependencies: [
                .target(name: "ClientConsumingSmokeFrameworkOperations"),
                .product(name: "SmokeOperationsHTTP1", package: "smoke-framework"),
                .product(name: "SmokeOperationsHTTP1Server", package: "smoke-framework"),
            ],
            plugins: [
                .plugin(name: "SmokeFrameworkGenerateHttp1", package: "smoke-framework-application-generate")
            ]),
        .executableTarget(
            name: "ClientConsumingSmokeFrameworkService", dependencies: [
                .target(name: "ClientConsumingSmokeFrameworkOperationsHTTP1"),
                .product(name: "SmokeAWSCredentials", package: "smoke-aws-credentials"),
                .product(name: "SmokeOperationsHTTP1Server", package: "smoke-framework"),
                .product(name: "AWSLogging", package: "smoke-aws-support"),
                .product(name: "OtherClient", package: "OtherServiceSwiftClient"),
            ]),
        .testTarget(
            name: "ClientConsumingSmokeFrameworkOperationsTests", dependencies: [
                .target(name: "ClientConsumingSmokeFrameworkOperations"),
            ]),
        ],
        swiftLanguageVersions: [.v5]
)
