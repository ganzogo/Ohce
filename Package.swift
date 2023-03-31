// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Ohce",
    dependencies: [
        //.package(url: "https://github.com/kylef/Commander.git", .exact("0.9.1")),
        //.package(url: "https://github.com/kareman/SwiftShell.git", .exact("5.1.0")),
    ],
    targets: [
        .target(name: "Ohce", dependencies: ["OhceCore"]),
        .target(name: "OhceCore", dependencies: []),
        .testTarget(name: "OhceCoreTests", dependencies: ["OhceCore"]),
    ]
)