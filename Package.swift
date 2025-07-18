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
            url: "https://github.com/swiftty/XcodeGenBinary/releases/download/2.44.0/XcodeGenBinary.artifactbundle.6.1.2.zip%0A7259e4a4ed22800bb3415d88a7ea061de2593e22d2a5b5837b48f5a2889a9a7c",
            checksum: "d490dc4164c2a7a7d381c394c3ac8e280dcb34a87433ace7dde643c2b1309718"
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
