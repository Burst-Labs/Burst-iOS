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
            url: "https://cdn.burst-app.com/sdks/BurstSDK-1.0.0.xcframework.zip",
            checksum: "eeac1113cbd3720031c23b0dada1333c4022310e9a0ef230c5c41b3d340437b1"
        )
    ]
)
