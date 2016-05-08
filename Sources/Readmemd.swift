private let readmeFileName = "README.md"

/**
 Duplicate an existing README.md.
 - note: Do not overwrite an existing file.
 - parameters:
   - existingReadmeDirctoryPath: Dirctory path of an existing Readme.md.
   - newReadmeDirectoryPath: Dirctory path of new Readme.md.
 */
func duplicateExistingReadme(existingReadmeDirctoryPath sourcePath: String, newReadmeDirectoryPath targetPath: String) {
    guard let output = executeCommand(argments: ["cp", "-nv", "\(sourcePath)/\(readmeFileName)", targetPath]) else {
        return
    }
    print(output)
}

/**
 Replace strings in a README.md located in the current directory.
 - parameters:
   - source: Source string.
   - target: Target string.
 */
func replaceStringsInReadme(source: String, target: String) {
    print("./\(readmeFileName):")
    print("    `\(source)` -> \(target)")
    guard let output = executeCommand(argments:["sed", "-i", "", "-e", "s/\(source)/\(target)/g", "./\(readmeFileName)"]) else { return }
    print(output)
}
