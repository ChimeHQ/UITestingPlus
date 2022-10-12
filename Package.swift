// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "UITestingPlus",
	platforms: [.macOS(.v11), .iOS(.v13)],
    products: [
        .library(
            name: "UITestingPlus",
            targets: ["UITestingPlus"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "UITestingPlus", dependencies: []),
        .testTarget(name: "UITestingPlusTests", dependencies: ["UITestingPlus"]),
    ]
)
