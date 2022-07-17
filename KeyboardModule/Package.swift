// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KeyboardModule",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "KeyboardModule",
            targets: ["KeyboardModule"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(path: "../UnicodeData"),
        .package(url: "https://github.com/Roman-Kerimov/LinguisticKit.git", branch: "master"),
        .package(url: "https://github.com/Roman-Kerimov/Calculator.git", branch: "master"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "KeyboardModule",
            dependencies: ["UnicodeData", "LinguisticKit", "Calculator"],
            resources: [
                .process("AssetColor.xcassets"),
            ]),
        .testTarget(
            name: "KeyboardModuleTests",
            dependencies: ["KeyboardModule"]),
    ]
)
