import Darwin

let readmeFileName = "README.md"

/// Do not overwrite an existing file.
func duplicateExistingReadme(existingReadmeDirctoryPath sourcePath: String, newReadmeDirectoryPath targetPath: String) {
    excuteCommand(argments: ["cp", "-n", sourcePath + "/" + readmeFileName, targetPath])
}

func replaceStringsInReadme(source: String, target: String) {
    excuteCommand(argments:["sed", "-i", "", "-e", "s/\(source)/\(target)/g", "./\(readmeFileName)"])
}
