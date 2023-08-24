// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XcodeGenBinary",
    products: [
        .plugin(name: "XcodeGenPlugin", targets: ["XcodeGenPlugin"])
    ],
    targets: [
        .binaryTarget(
            name: "XcodeGenBinary",
            url: "<url>",
            checksum: "<checksum>"
        ),
        .plugin(
            name: "XcodeGenPlugin",
            capability: .command(
                intent: .custom(
                    verb: "xcodegen",
                    description: "A Swift command line tool for generating your Xcode project"
                )
            ),
            dependencies: [
                "XcodeGenBinary"
            ]
        )
    ]
)
