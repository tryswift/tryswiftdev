enum Options: String, CustomStringConvertible {
    case DuplicateReadme
    case ReplaceStringsInReadme
    case FindIt
    case UpdateVersionStrings
    case Usage
    
    init?(argment: String) {
        switch argment {
        case "-d", "--duplicate-readme":
            self = .DuplicateReadme
        case "-r", "--replace-readme":
            self = .ReplaceStringsInReadme
        case "-f", "--find-it":
            self = .FindIt
        case "-u", "--update-version":
            self = .UpdateVersionStrings
        case "-h", "--help":
            self = .Usage
        default:
            return nil
        }
    }
    
    var description: String {
        switch self {
        case .DuplicateReadme:
            return "Duplicate an existing README.md."
                + "\n                                Do not overwrite an existing file."
        case .ReplaceStringsInReadme:
            return "Replace strings in a README.md"
                + "\n                                located in the current directory."
        case .FindIt:
            return "Search for specified file."
        case .UpdateVersionStrings:
            return "Update version strings in specified files."
        case .Usage:
            return "Display available options."
        }
    }
}
