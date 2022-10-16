// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OtherServiceModel",
    products: [
        .library(
            name: "OtherServiceModel",
            targets: ["OtherServiceModel"]),
    ],
    targets: [
        .target(
            name: "OtherServiceModel",
            dependencies: [],
            path: "api",
            resources: [.copy("OpenAPI30.yaml")]),
    ]
)
