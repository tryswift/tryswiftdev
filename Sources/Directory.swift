import Darwin

func currentDirectoryPath() throws -> String {
    let cwd = getcwd(nil, Int(PATH_MAX))
    guard cwd != nil else {
        // TODO:
        free(cwd)
        throw Error.CannotGetCwd
    }
    guard let path = String(validatingUTF8: cwd) else { throw Error.CannotGetCwd }
    return path
}

func changeDirectory(path: String) throws {
    guard chdir(path) == 0 else {
        throw Error.CannotChangeDirectory
    }
}
