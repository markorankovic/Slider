// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Slider",
    products: [
        .library(
            name: "Slider",
            targets: ["Slider"]),
    ],
    targets: [
        .target(
            name: "Slider",
            dependencies: []),
        .testTarget(
            name: "SliderTests",
            dependencies: ["Slider"]),
    ]
)
