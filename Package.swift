// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DiyalogSwiftPackages",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "DiyalogSwiftPackages",
            targets: ["DiyalogSwiftPackages","DiyalogEngine","j2objc","WebRTC","opus"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "DiyalogSwiftPackages",
            dependencies: []),
        .testTarget(
            name: "DiyalogSwiftPackagesTests",
            dependencies: ["DiyalogSwiftPackages"]),
        .binaryTarget(
            name: "DiyalogEngine",
            url: "https://diyalog.im/releases/DiyalogEngine/5.15.0/DiyalogEngine.zip",
            checksum: "73f005bf1bdcb6c4157131a8632e794a1f4a62a950ef65abf19701af075e3550"
        ),
        .binaryTarget(
            name: "j2objc",
            url: "https://diyalog.im/releases/j2objc/2.0.0/j2objc.zip",
            checksum: "da5a0260768b0ae8282632c242ac4c91b6fc02893acef2164ee5cf9c1d95c259"
        ),
        .binaryTarget(
            name: "WebRTC",
            url: "https://diyalog.im/releases/WebRTC/1.1.2941/WebRTC.zip",
            checksum: "9c5caa090782eefb518889d80afb6dad2311af132c8b0e89997777ff9d63ebbc"
        ),
        .binaryTarget(
            name: "opus",
            url: "https://diyalog.im/releases/opus/1.4/opus.zip",
            checksum: "dcc77a8163b84bb1d4d8504ec4e3a6348168bdd04e76a24e9867d53f4ab77331"
        )
    ]
)
