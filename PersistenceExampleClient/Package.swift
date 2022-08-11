// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "PersistenceExampleSwiftClient",
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
        ],
    dependencies: [
        .package(path: "../ServiceModel"),
        .package(url: "https://github.com/amzn/smoke-aws.git", from: "2.35.31"),
        .package(url: "https://github.com/apple/swift-log", from: "1.0.0"),
        .package(url: "https://github.com/amzn/smoke-aws-generate.git", from: "3.0.0-beta-4"),
        ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(name: "PersistenceExampleModel", dependencies: [
            .product(name: "Logging", package: "swift-log"),
                .product(name: "ServiceModel", package: "ServiceModel"),
                .product(name: "APIGatewayClientModelGenerate", package: "smoke-aws-generate")
            ],
            plugins: [
                .plugin(name: "APIGatewaySwiftGenerateModel", package: "smoke-aws-generate")
            ]
        ),
        .target(name: "PersistenceExampleClient", dependencies: [
            .target(name: "PersistenceExampleModel"),
                .product(name: "ServiceModel", package: "ServiceModel"),
            .product(name: "SmokeAWSHttp", package: "smoke-aws"),
            .product(name: "APIGatewayClientModelGenerate", package: "smoke-aws-generate")
            ],
            plugins: [
                .plugin(name: "APIGatewaySwiftGenerateClient", package: "smoke-aws-generate")
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
