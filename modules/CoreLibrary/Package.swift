// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreLibrary",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CoreModules",
            targets: [
                // Concrete
                "DependencyInjection",
                "Navigation",
                "Networking",
                "Services",
                // Interfaces
                "NetworkingInterface",
                "ServicesInterface",
            ]
        ),
        // Essentials
        .library(
            name: "DependencyInjection",
            targets: ["DependencyInjection"]
        ),
        .library(
            name: "Navigation",
            targets: ["Navigation"]
        ),
        .library(
            name: "NetworkingInterface",
            targets: ["NetworkingInterface"]
        ),
        // Domain(-ish)
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
        // DependencyInjection
        .target(
            name: "DependencyInjection",
            dependencies: []
        ),
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
            name: "NetworkingInterface",
            dependencies: []
        ),
        .target(
            name: "Networking",
            dependencies: [
                "NetworkingInterface",
            ]
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
                "ServicesInterface",
                "NetworkingInterface",
            ],
            resources: [
                .process("Resources/home_restaurant_list.json"),
                .process("Resources/restaurant_details.json"),
            ]
        ),
        .testTarget(
            name: "ServicesTests",
            dependencies: ["Services"]
        ),
    ]
)
