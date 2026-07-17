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
            url: "https://github.com/swiftty/XcodeGenBinary/releases/download/2.46.0/XcodeGenBinary.artifactbundle.zip",
            checksum: "bbc6c8f50ad8d203e661084efca7ef12701837e6f371ae35935a99e812e80a6b"
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
