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
            url: "https://github.com/swiftty/XcodeGenBinary/releases/download/2.39.1/XcodeGenBinary.artifactbundle.5.8.1.zip",
            checksum: "ac924226841a80deb2bd14652648e6ac8eb11b755da09d7eed5358e3b4b44c3f"
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
