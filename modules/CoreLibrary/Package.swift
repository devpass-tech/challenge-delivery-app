// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreLibrary",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CoreModules",
            targets: ["Navigation", "Networking", "Services", "ServicesInterface"]
        ),
        .library(
            name: "Navigation",
            targets: ["Navigation"]
        ),
        .library(
            name: "Services", // remove?
            targets: ["Services"]
        ),
        .library(
            name: "ServicesInterface",
            targets: ["ServicesInterface"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Navigation
        .target(
            name: "Navigation",
            dependencies: []
        ),
        .testTarget(
            name: "NavigationTests",
            dependencies: ["Navigation"]
        ),
        // Networking
        .target(
            name: "Networking",
            dependencies: []
        ),
        .testTarget(
            name: "NetworkingTests",
            dependencies: ["Networking"]
        ),
        // Services
        .target(
            name: "ServicesInterface",
            dependencies: []
        ),
        .target(
            name: "Services",
            dependencies: [
                "ServicesInterface"
            ]
        ),
        .testTarget(
            name: "ServicesTests",
            dependencies: ["Services"]
        ),
    ]
)
