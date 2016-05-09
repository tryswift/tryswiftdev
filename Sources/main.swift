do {
    print("")
    
    let arguments = Process.arguments.dropFirst()
    guard let arg1 = arguments.first else {
        usage()
        throw Error.InvalidValue
    }
    guard let option = Options(argment: arg1) else {
        usage()
        throw Error.InvalidValue
    }
    guard let value1 = arguments.dropFirst().first else {
        usage()
        throw Error.InvalidValue
    }
    guard let value2 = arguments.dropFirst(2).first else {
        usage()
        throw Error.InvalidValue
    }
    
    switch option {
    case .DuplicateReadme:
        duplicateExistingReadme(existingReadmeDirctoryPath: value1, newReadmeDirectoryPath: value2)
    case .ReplaceStringsInReadme:
        replaceStringsInReadme(source: value1, target: value2)
    case .FindIt:
        guard value1 == "-name" else {
            // TODO: For now, support `-name` only.
            throw Error.UnsupportedOption
        }
        findFile(targetOption: "-name", targetName: value2)
    case .UpdateVersionStrings:
        try updateVersionStrings(configurationFileFullPath: value1, rootDirectoryPath: value2)
    case .Usage:
        usage()
    }
} catch let error as Error {
    print(error.description)
} catch {
    // TODO: Error Handling
    print("Error!!")
}

print("")
