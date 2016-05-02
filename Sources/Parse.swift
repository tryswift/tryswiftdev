func parseToArray(source: String) -> [String] {
    return source.characters.split(separator: "\n").map { String($0) }
}
