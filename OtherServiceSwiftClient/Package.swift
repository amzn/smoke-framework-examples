// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "OtherSwiftClient",
    platforms: [
        .macOS(.v10_15), .iOS(.v10)
        ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "OtherModel",
            targets: ["OtherModel"]),
        .library(
            name: "OtherClient",
            targets: ["OtherClient"]),
        ],
    dependencies: [
        .package(path: "../OtherServiceModel"),
        .package(url: "https://github.com/amzn/smoke-aws-support.git", from: "1.0.0"),
        .package(url: "https://github.com/amzn/smoke-http.git", from: "2.14.0"),
        .package(url: "https://github.com/apple/swift-log", from: "1.0.0"),
        .package(url: "https://github.com/amzn/smoke-aws-generate.git", from: "3.0.0-rc.1"),
        ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(name: "OtherModel", dependencies: [
            .product(name: "Logging", package: "swift-log"),
                .product(name: "OtherServiceModel", package: "OtherServiceModel"),
                .product(name: "APIGatewayClientModelGenerate", package: "smoke-aws-generate")
            ],
            plugins: [
                .plugin(name: "APIGatewaySwiftGenerateModel", package: "smoke-aws-generate")
            ]
        ),
        .target(name: "OtherClient", dependencies: [
            .target(name: "OtherModel"),
                .product(name: "OtherServiceModel", package: "OtherServiceModel"),
            .product(name: "AWSHttp", package: "smoke-aws-support"),
            .product(name: "SmokeHTTPClient", package: "smoke-http"),
            .product(name: "APIGatewayClientModelGenerate", package: "smoke-aws-generate")
            ],
            plugins: [
                .plugin(name: "APIGatewaySwiftGenerateClient", package: "smoke-aws-generate")
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
