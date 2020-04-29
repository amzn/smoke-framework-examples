// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EmptyExample",
    platforms: [
      .macOS(.v10_15), .iOS(.v10)
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
        .package(url: "https://github.com/amzn/smoke-framework.git", from: "2.0.0-rc.1"),
        .package(url: "https://github.com/amzn/smoke-aws-credentials.git", from: "2.0.0-rc.1"),
        .package(url: "https://github.com/amzn/smoke-aws.git", from: "2.0.0-rc.1"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
        ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "EmptyExampleModel", dependencies: [
                .product(name: "SmokeOperations", package: "smoke-framework"),
                .product(name: "Logging", package: "swift-log"),
            ]),
        .target(
            name: "EmptyExampleOperations", dependencies: [
                .target(name: "EmptyExampleModel"),
            ]),
        .target(
            name: "EmptyExampleOperationsHTTP1", dependencies: [
                .target(name: "EmptyExampleOperations"),
                .product(name: "SmokeOperationsHTTP1", package: "smoke-framework"),
            ]),
        .target(
            name: "EmptyExampleClient", dependencies: [
                .target(name: "EmptyExampleModel"),
                .product(name: "SmokeOperationsHTTP1", package: "smoke-framework"),
                .product(name: "SmokeAWSHttp", package: "smoke-aws"),
            ]),
        .target(
            name: "EmptyExampleService", dependencies: [
                .target(name: "EmptyExampleOperationsHTTP1"),
                .product(name: "SmokeAWSCredentials", package: "smoke-aws-credentials"),
                .product(name: "SmokeOperationsHTTP1Server", package: "smoke-framework"),
            ]),
        .testTarget(
            name: "EmptyExampleOperationsTests", dependencies: [
                .target(name: "EmptyExampleOperations"),
            ]),
        ],
        swiftLanguageVersions: [.v5]
)
