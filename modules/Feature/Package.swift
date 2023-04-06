// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Feature",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "Restaurants",
            targets: ["Restaurants"]),
        .library(
            name: "Home",
            targets: ["Home"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Home",
            dependencies: []),
        .target(
            name: "Restaurants",
            dependencies: []),
        .testTarget(
            name: "RestaurantsTests",
            dependencies: ["Restaurants"]),
    ]
)
