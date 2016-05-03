private let readmeFileName = "README.md"

/**
 Duplicate an existing README.md.
 - note: Do not overwrite an existing file.
 - parameters:
   - existingReadmeDirctoryPath: Dirctory path of an existing Readme.md.
   - newReadmeDirectoryPath: Dirctory path of new Readme.md.
 */
func duplicateExistingReadme(existingReadmeDirctoryPath sourcePath: String, newReadmeDirectoryPath targetPath: String) {
    executeCommand(argments: ["cp", "-nv", "\(sourcePath)/\(readmeFileName)", targetPath])
}

/**
 Replace strings in a README.md located in the current directory.
 - parameters:
   - source: Source string.
   - target: Target string.
 */
func replaceStringsInReadme(source: String, target: String) {
    executeCommand(argments:["sed", "-i", "", "-e", "s/\(source)/\(target)/g", "./\(readmeFileName)"])
}
