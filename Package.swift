// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "AppEssentials",
    platforms: [
        .iOS(.v26),
        .macOS(.v26)
    ],
    products: [
        .library(name: "AboutSection", targets: ["AboutSection"]),
        .library(name: "WhatsNew", targets: ["WhatsNew"])
    ],
    targets: [
        .target(name: "AppEssentialsCore"),
        .target(name: "AboutSection", dependencies: ["AppEssentialsCore"]),
        .target(name: "WhatsNew", dependencies: ["AppEssentialsCore"]),
        .testTarget(name: "WhatsNewTests", dependencies: ["WhatsNew"])
    ],
    swiftLanguageModes: [.v6]
)
