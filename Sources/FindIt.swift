private let maybeHere = [
    "/Applications/Xcode.app/Contents",
    "/Library/Developer",
    "/Library/Frameworks",
]

private let xcodeBuildSettings = [
    "ENABLE_BITCODE=0",
    "SWIFT_DISABLE_REQUIRED_ARCLITE=1",
    "TOOLCHAINS=org.swift.3020160425a",
    "XCODE_DEFAULT_TOOLCHAIN_OVERRIDE=/Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-2016-04-25-a.xctoolchain",
]

private var LD_RUNPATH_SEARCH_PATHS = String()
private var FRAMEWORK_SEARCH_PATHS = String()

func getXcodeBuildSettings() {
    guard let outputString = executeCommand(argments: ["xcodebuild", "-showBuildSettings"] + xcodeBuildSettings) else { return }
    
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
            LD_RUNPATH_SEARCH_PATHS = String(xcodeBuildSetting.characters.dropFirst(26))
        } else if xcodeBuildSetting.hasPrefix("FRAMEWORK_SEARCH_PATHS = ") {
            FRAMEWORK_SEARCH_PATHS = String(xcodeBuildSetting.characters.dropFirst(25))
        }
    }
}

func findFile(targetOption option: String, targetName name: String) {
    getXcodeBuildSettings()
    
    print("")
    var existingFilePaths = [String]()
    maybeHere.forEach {
        print("Searching... \($0)")
        guard let outputString = executeCommand(argments: ["find", $0, option, name]) else { return }
        existingFilePaths.append(contentsOf: [outputString])
    }
    displayResult(sources: parseToArray(source: existingFilePaths.reduce("", combine: { $0 + $1 })))
}

func displayResult(sources: [String]) {
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
    print("  - \(LD_RUNPATH_SEARCH_PATHS)")
    print("")
    print("Your `Framework Search Paths`(FRAMEWORK_SEARCH_PATHS):")
    print("  - \(FRAMEWORK_SEARCH_PATHS)")
}
