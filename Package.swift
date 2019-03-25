// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AnimalFarm",
    dependencies: [
        .package(url: "https://github.com/Azoy/Sword", .branch("master")),
        .package(url: "https://github.com/IBM-Swift/HeliumLogger.git", from: "1.8.0")
    ],
    targets: [
        .target(
            name: "AnimalFarm",
            dependencies: ["Sword", "HeliumLogger"])
    ]
)
