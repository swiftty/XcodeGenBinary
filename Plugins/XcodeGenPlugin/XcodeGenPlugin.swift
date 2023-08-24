import Foundation
import PackagePlugin

private protocol PluginToolProviding {
    func tool(named: String) throws -> PluginContext.Tool
}

extension PluginContext: PluginToolProviding {}

@main
struct XcodeGenPlugin: CommandPlugin {
    func performCommand(context: PluginContext, arguments: [String]) async throws {
        var extractor = ArgumentExtractor(arguments)
        _ = extractor.extractOption(named: "target")

        try run(context: context, arguments: extractor.remainingArguments)
    }

    private func run(context: PluginToolProviding, arguments: [String]) throws {
        let tool = try context.tool(named: "xcodegen")
        let toolURL = URL(fileURLWithPath: tool.path.string)

        let process = Process()
        process.executableURL = toolURL
        process.arguments = arguments

        try process.run()
        process.waitUntilExit()

        guard process.terminationReason == .exit, process.terminationStatus == 0 else {
            let problem = "\(process.terminationReason):\(process.terminationStatus)"
            Diagnostics.error("xcodegen invocation failed: \(problem)")
            return
        }
    }
}

#if canImport(XcodeProjectPlugin)
import XcodeProjectPlugin

extension XcodePluginContext: PluginToolProviding {}

extension XcodeGenPlugin: XcodeCommandPlugin {
    func performCommand(context: XcodePluginContext, arguments: [String]) throws {
        var extractor = ArgumentExtractor(arguments)
        _ = extractor.extractOption(named: "target")

        try run(context: context, arguments: extractor.remainingArguments)
    }
}

#endif
