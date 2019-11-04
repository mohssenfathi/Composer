// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Composer",
    platforms: [
        .iOS(SupportedPlatform.IOSVersion.v11)
    ],
    products: [
        .library(
            name: "Composer",
            targets: ["Composer"]),
    ],
    dependencies: [ ],
    targets: [
        .target(
            name: "Composer",
            dependencies: []),
        .testTarget(
            name: "ComposerTests",
            dependencies: ["Composer"]),
    ]
)
