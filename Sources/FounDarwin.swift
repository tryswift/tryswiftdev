import FounDarwin

/**
 - parameters:
   - argments: e.g. `["ls", "-1R"]`.
 - returns: Return nil if output is empty.
 - note: An environment valiables are not inherited.
 */
func executeCommand(argments args: [String]) -> String? {
    return FounDarwin.executeCommand(argments: args)
}

func changeDirectory(path: String) throws {
    try FounDarwin.changeDirectory(path: path)
}
