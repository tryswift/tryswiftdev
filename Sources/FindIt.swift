let maybeHere = [
    "/Applications/Xcode.app/Contents",
    "/Library/Developer",
    "/Library/Frameworks",
]

func findFile(targetOption option: String, targetName name: String) {
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
    sources.forEach { print("  - \($0)\n") }
    print("")
    print("(Check your `Runpath Search Paths`, `Framework Search Paths`, etc.)")
}
