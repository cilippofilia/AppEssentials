// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "AppEssentials",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v18),
        .macOS(.v15)
    ],
    products: [
        .library(name: "AboutSection", targets: ["AboutSection"]),
        .library(name: "WhatsNew", targets: ["WhatsNew"])
    ],
    targets: [
        .target(name: "AppEssentialsCore"),
        .target(name: "AboutSection", dependencies: ["AppEssentialsCore"], resources: [.process("Resources")]),
        .target(name: "WhatsNew", dependencies: ["AppEssentialsCore"], resources: [.process("Resources")]),
        .testTarget(name: "WhatsNewTests", dependencies: ["WhatsNew"])
    ],
    swiftLanguageModes: [.v6]
)
