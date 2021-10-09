// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "AppleKit",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "AppleKit",
            targets: ["AppleKit"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AppleKit",
            dependencies: []
        ),
        .testTarget(
            name: "AppleKitTests",
            dependencies: ["AppleKit"]),
    ]
)
