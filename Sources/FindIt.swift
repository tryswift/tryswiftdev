private let maybeHere = [
    "/Applications/Xcode.app/Contents",
    "/Library/Developer",
    "/Library/Frameworks",
]

private let xcodeBuildInitialSettings = [
    "ENABLE_BITCODE=0",
    "SWIFT_DISABLE_REQUIRED_ARCLITE=1",
    "SWIFT_LINK_OBJC_RUNTIME=1",
    "TOOLCHAINS=org.swift.3020160425a",
    "XCODE_DEFAULT_TOOLCHAIN_OVERRIDE=/Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-2016-04-25-a.xctoolchain",
]

func getXcodeBuildSettings() -> [String: String]? {
    guard let outputString = executeCommand(argments: ["xcodebuild", "-showBuildSettings"] + xcodeBuildInitialSettings) else { return nil }
    
    var xcodeBuildSettings = [String: String]()
    outputString.characters.split(separator: "\n").map(String.init).forEach {
        var characters = $0.characters
        loop: while true {
            switch characters.first {
            case " "?:
                characters = characters.dropFirst()
            default:
                break loop
            }
        }
        
        let xcodeBuildSetting = String(characters)
        if xcodeBuildSetting.hasPrefix("LD_RUNPATH_SEARCH_PATHS = ") {
            xcodeBuildSettings["LD_RUNPATH_SEARCH_PATHS"] = String(xcodeBuildSetting.characters.dropFirst(26))
        } else if xcodeBuildSetting.hasPrefix("FRAMEWORK_SEARCH_PATHS = ") {
            xcodeBuildSettings["FRAMEWORK_SEARCH_PATHS"] = String(xcodeBuildSetting.characters.dropFirst(25))
        }
    }
    return xcodeBuildSettings
}

func searchFile(targetOption option: String, targetName name: String) -> [String]? {
    print("")
    var existingFilePaths = [String]()
    maybeHere.forEach {
        print("Searching... \($0)")
        guard let outputString = executeCommand(argments: ["find", $0, option, name]) else { return }
        guard !outputString.isEmpty else { return }
        existingFilePaths.append(contentsOf: parseToArray(source: outputString))
    }
    return existingFilePaths
}

func displayResult(sources: [String], runpathSearchPaths: String?, frameworkSearchPaths: String?) {
    print("")
    guard !sources.isEmpty else {
        print("Not found.")
        return
    }
    
    print("Found it!")
    print("")
    sources.forEach { print("  - \($0)") }
    print("")
    print("Your `Runpath Search Paths`(LD_RUNPATH_SEARCH_PATHS):")
    print("  - \(runpathSearchPaths ?? "(empty)")")
    print("")
    print("Your `Framework Search Paths`(FRAMEWORK_SEARCH_PATHS):")
    print("  - \(frameworkSearchPaths ?? "(empty)")")
}

func findFile(targetOption option: String, targetName name: String) {
    guard let xcodeBuildSettings = getXcodeBuildSettings() else { return }
    guard let existingFilePaths = searchFile(targetOption: option, targetName: name) else { return }
    displayResult(sources: parseToArray(source: existingFilePaths.reduce("", combine: { $0 + $1 })),
                  runpathSearchPaths: xcodeBuildSettings["LD_RUNPATH_SEARCH_PATHS"],
                  frameworkSearchPaths: xcodeBuildSettings["FRAMEWORK_SEARCH_PATHS"])
}
