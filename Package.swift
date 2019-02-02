// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AnimalFarm",
    dependencies: [
        .package(url: "https://github.com/Azoy/Sword", .branch("master"))
    ],
    targets: [
        .target(
            name: "AnimalFarm",
            dependencies: ["Sword"])
    ]
)
