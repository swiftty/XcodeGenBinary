# XcodeGen Pre-build executable binary for SwiftPM plugins

This repository distributes a pre-built executable binary for [XcodeGen](https://github.com/yonaskolb/XcodeGen) that can be used with Swift Package Manager plugins.

## Installation

To dependencies,
```swift
.package(url: "https://github.com/swiftty/XcodeGenBinary.git", from: "2.39.1")
```

Run XcodeGen via SwiftPM command plugin.

```shell-session
$ swift package plugin --allow-writing-to-directory . xcodegen
```
