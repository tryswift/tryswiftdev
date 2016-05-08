import Darwin

/*
func readFileToLines(path targetPath: String) -> [String]? {
    guard !targetPath.isEmpty else { return nil }
    guard let targetFile = fopen(targetPath, "r") else { return nil }
    
    let newLine = Int32(UInt8(ascii: UnicodeScalar("\n")))
    var combineString = String()
    var lines = [String]()
    
    while true {
        let c = fgetc(targetFile)
        switch c {
        case EOF:
            // TODO: close?
            if !combineString.isEmpty {
                lines.append(combineString)
            }
            return lines
        case newLine:
            lines.append(combineString)
            combineString = String()
        default:
            combineString.append(UnicodeScalar(UInt8(c)))
        }
    }
}
 */

func openVersionStringsInfoFile(path targetPath: String) -> [VersionStringsInfo]? {
    guard let targetFile = fopen(targetPath, "r") else { return nil }
    
    let separator = Int32(UInt8(ascii: UnicodeScalar(",")))
    let newLine = Int32(UInt8(ascii: UnicodeScalar("\n")))    // 10
    let space = Int32(UInt8(ascii: UnicodeScalar(" ")))
    
    var combineString = String()
    var versionStringsInfo = VersionStringsInfo()
    var targetVersionStrings = [VersionStringsInfo]()
    
//    let bufferSize = 4096
//    var buffer = [Int8](repeating: 0, count: bufferSize + 1)
    
//    while true {
//        let c = fgetc(targetFile)
//        guard c != EOF else { return targetVersionStrings }
//        let s = fgets(&buffer, 4096, targetFile)
//        guard let output = String(validatingUTF8: s) else { return nil }
//        guard !output.isEmpty else { return nil }
//        print(output)
//        output.characters.split(separator: ",").forEach {
//            print(String($0))
//        }
//    }
    
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
