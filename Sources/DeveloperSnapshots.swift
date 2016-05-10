func downloadAndInstallSnapshot(snapshotVersion version: String) {
    downloadSnapshot(snapshotVersion: version)
    installSnapshot(snapshotVersion: version)
    removeSnapshot(snapshotVersion: version)
}
