// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Sign-Bunny-Bot",
    dependencies: [
        .package(url: "https://github.com/Azoy/Sword", .branch("master"))
    ],
    targets: [
        .target(
            name: "Sign-Bunny-Bot",
            dependencies: ["Sword"]),
        .testTarget(
            name: "Sign-Bunny-BotTests",
            dependencies: ["Sign-Bunny-Bot"]),
    ]
)
