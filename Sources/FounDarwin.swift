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

func downloadSnapshot(snapshotVersion version: String) {
    FounDarwin.downloadPackage(snapshotVersion: version)
}

func installSnapshot(snapshotVersion version: String) {
    FounDarwin.installPackage(snapshotVersion: version)
}

func removeSnapshot(snapshotVersion version: String) {
    FounDarwin.removePkgFile(snapshotVersion: version)
}
