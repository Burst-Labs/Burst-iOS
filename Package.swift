// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "BurstSDK",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "BurstSDK",
            targets: ["BurstSDK"]),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "BurstSDK",
            url: "https://cdn.burst-app.com/sdks/BurstSDK-1.2.0.xcframework.zip",
            checksum: "ea6f76269d3becfa7c2272e2a3613097d961659b6d7fcfd5b083253b304ed6c5"
        )
    ]
)
