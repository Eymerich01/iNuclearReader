// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iNucleoReader",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "iNucleoReader",
            targets: ["iNucleoReader"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "iNucleoReader", resources: [
                .process("Resource/ensdf.040")
            ]),
        .testTarget(
            name: "iNucleoReaderTests",
            dependencies: ["iNucleoReader"],
            resources: [
                .process("Resource/ensdf.040")
            ]
        ),
    ]
)
