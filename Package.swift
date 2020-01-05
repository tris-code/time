// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "Time",
    products: [
        .library(name: "Time", targets: ["Time"]),
    ],
    dependencies: [
        .package(path: "../Platform"),
        .package(path: "../Test")
    ],
    targets: [
        .target(
            name: "Time",
            dependencies: ["Platform"]),
        .testTarget(
            name: "TimeTests",
            dependencies: ["Test", "Time"])
    ]
)

#if os(Linux)
package.targets.append(.target(name: "CTime"))
package.targets[0].dependencies.append("CTime")
#endif
