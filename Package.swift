// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "AnimalFarm",
    dependencies: [
        .package(url: "https://github.com/Azoy/Sword", .branch("master")),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "AnimalFarm"
        ),
        .target(
            name: "AnimalFarmDiscord",
            dependencies: [
                .target(name: "AnimalFarm"),
                "Sword",
                "Logging"
            ]
        )
    ]
)
