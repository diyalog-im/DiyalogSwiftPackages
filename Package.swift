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
            url: "https://diyalog.im/releases/DiyalogEngine/5.6.9/DiyalogEngine.zip",
            checksum: "ebaec8fc23ac382d639149ae591e7b9923db020e0a86f2b45a1ca894adb4a687"
        ),
        .binaryTarget(
            name: "j2objc",
            url: "https://diyalog.im/releases/j2objc/1.0.5/j2objc.zip",
            checksum: "659f1b90df7b16b6e0cc5c62f209815dc6e0dd387309bc2d1b33ab8eb6cf798b"
        ),
        .binaryTarget(
            name: "WebRTC",
            url: "https://diyalog.im/releases/WebRTC/1.1.2941/WebRTC.zip",
            checksum: "9c5caa090782eefb518889d80afb6dad2311af132c8b0e89997777ff9d63ebbc"
        ),
        .binaryTarget(
            name: "opus",
            url: "https://diyalog.im/releases/opus/1.3/opus.zip",
            checksum: "adc7b8a7427ed9d81f1d67f861313574aaa913522495fb000f5f3be81c92fbeb"
        )
    ]
)
