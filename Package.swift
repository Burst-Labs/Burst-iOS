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
            path: "xcframeworks/BurstSDK.xcframework"
        )
    ]
)
