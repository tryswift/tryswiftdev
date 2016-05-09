import Darwin

func openVersionStringsInfoFile(path targetPath: String) -> [VersionStringsInfo]? {
    guard let targetFile = fopen(targetPath, "r") else { return nil }
    
    let separator = Int32(UInt8(ascii: UnicodeScalar(",")))
    let newLine = Int32(UInt8(ascii: UnicodeScalar("\n")))
    let space = Int32(UInt8(ascii: UnicodeScalar(" ")))
    
    var combineString = String()
    var versionStringsInfo = VersionStringsInfo()
    var targetVersionStrings = [VersionStringsInfo]()
    
    while true {
        let c = fgetc(targetFile)
        switch c {
        case EOF:
            // TODO: close?
            guard ferror(targetFile) == 0 else { return nil }
            return targetVersionStrings
        case separator:
            if versionStringsInfo.filePath.isEmpty {
                versionStringsInfo.filePath = combineString
            } else if versionStringsInfo.regularExpression.isEmpty {
                versionStringsInfo.regularExpression = combineString
            } else {
                return nil
            }
            combineString = String()
        case newLine:
            guard !combineString.isEmpty else { break }
            guard !versionStringsInfo.filePath.isEmpty
                && !versionStringsInfo.regularExpression.isEmpty
                && versionStringsInfo.newString.isEmpty else {
                // TODO: Error Handling
                print("\n=== Invalid versionStringsInfo ===\n")
                return nil
            }
            
            versionStringsInfo.newString = combineString
            targetVersionStrings.append(versionStringsInfo)
            combineString = String()
            versionStringsInfo = VersionStringsInfo()
        case space:
            guard !combineString.isEmpty else { break }
            fallthrough
        default:
            combineString.append(UnicodeScalar(UInt8(c)))
        }
    }

    // MEMO: fgets(), .characters.split(separator: ",").map(String.init)
}

func removeFile(path: String) {
    // TODO: Error Handling
    remove(path)
}

func renameFile(oldFilePath old: String, newFilePath new: String) {
    // TODO: Error Handling
    rename(old, new)
}
