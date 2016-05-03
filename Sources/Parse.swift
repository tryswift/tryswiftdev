/**
 - parameters:
   - source: e.g. `"try!\nswift"`
 - returns: e.g. `["try!", "swift"]`
 */
func parseToArray(source: String) -> [String] {
    return source.characters.split(separator: "\n").map { String($0) }
}
