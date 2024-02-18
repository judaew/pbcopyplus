// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "pbcopyplus",
    platforms: [
        .macOS(.v10_12),
    ],
    targets: [
        .target(
            name: "pbcopyplus",
            path: "Sources/pbcopyplus"
        ),
    ]
)
