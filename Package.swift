// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftKeyPathSortingRetrofit",
    products: [
        .library(
            name: "SwiftKeyPathSortingRetrofit",
            targets: ["SwiftKeyPathSortingRetrofit"]),
    ],
    targets: [
        .target(
            name: "SwiftKeyPathSortingRetrofit"),
    ]
)
