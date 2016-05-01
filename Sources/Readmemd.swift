let readmeFileName = "README.md"

/// Do not overwrite an existing file.
func duplicateExistingReadme(existingReadmeDirctoryPath sourcePath: String, newReadmeDirectoryPath targetPath: String) {
    executeCommand(argments: ["cp", "-nv", "\(sourcePath)/\(readmeFileName)", targetPath])
}

func replaceStringsInReadme(source: String, target: String) {
    executeCommand(argments:["sed", "-i", "", "-e", "s/\(source)/\(target)/g", "./\(readmeFileName)"])
}
