// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "DallasRestaurants",
    products: [
        .library(name: "DallasRestaurants", targets: ["App"]),
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),

        // 🐬 Pure Swift MySQL client built on non-blocking, event-driven sockets.
        .package(url: "https://github.com/vapor/mysql.git", from: "3.0.0"),
    ],
    targets: [
        .target(name: "App", dependencies: ["MySQL", "Vapor"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)

