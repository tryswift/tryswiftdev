struct VersionStringsInfo {
    var filePath = String()
    var regularExpression = String()
    var newString = String()
}

func readVersionStringsInfo(fullPath: String) -> [VersionStringsInfo]? {
    guard let updateVersionStrings = openVersionStringsInfoFile(path: fullPath) else {
        return nil
    }
    return updateVersionStrings
}

func replaceStrings(in filePath: String, regularExpression: String, newString: String) {
    guard let output = executeCommand(argments:["sed", "-i", "", "-e", "s/\(regularExpression)/\(newString)/g", "\(filePath)"]) else { return }
    print(output)
    // TODO: Maybe nothing is displayed.
}

func updateVersionStrings(fullPath: String) {
    guard let versionStringsInfos = readVersionStringsInfo(fullPath: fullPath) else { return }
    versionStringsInfos.filter {
        !$0.filePath.isEmpty || !$0.regularExpression.isEmpty || !$0.newString.isEmpty
        }.forEach {
            replaceStrings(in: $0.filePath, regularExpression: $0.regularExpression, newString: $0.newString)
    }
}
