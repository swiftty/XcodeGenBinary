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
            url: "https://github.com/swiftty/XcodeGenBinary/releases/download/2.42.0/XcodeGenBinary.artifactbundle.5.9.2.zip",
            checksum: "fa0ed2334058f7680d137e5b9b0cc4cefff479ca80fbb13ab70b763751b5e160"
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
