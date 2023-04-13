// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Feature",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "FeaturesPack",
            targets: ["Home"]//, "Restaurants"]
        )
    ],
    dependencies: [
        .package(path: "../CoreLibrary"),
        .package(path: "../UI")
    ],
    targets: [
        // Home
        .target(
            name: "Home",
            dependencies: [
                // Features
//                .product(name: "Restaurants"),
                // Core
                .product(name: "Navigation", package: "CoreLibrary"),
                .product(name: "Services", package: "CoreLibrary"), // ->>> SERÁ?
                // Interfaces
                .product(name: "ServicesInterface", package: "CoreLibrary"),
                // UI
                .product(name: "UIFoundations", package: "UI"),
            ]
        ),
        .testTarget(
            name: "HomeTests",
            dependencies: ["Home"]
        ),
//        // Restaurants
//        .target(
//            name: "Restaurants",
//            dependencies: [
//                .product(name: "Navigation", package: "CoreLibrary"),
//                .product(name: "UIFoundations", package: "UI")
//            ]
//        ),
//        .testTarget(
//            name: "RestaurantsTests",
//            dependencies: ["Restaurants"]
//        ),
    ]
)
