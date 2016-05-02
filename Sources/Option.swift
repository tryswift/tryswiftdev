enum Options: String, CustomStringConvertible {
    case DuplicateReadme
    case ReplaceStringsInReadme
    case FindIt
    case Usage
    
    init?(argment: String) {
        switch argment {
        case "-d", "--duplicate-readme":
            self = .DuplicateReadme
        case "-r", "--replace-readme":
            self = .ReplaceStringsInReadme
        case "-f", "--find":
            self = .FindIt
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
        case .Usage:
            return "Display available options."
        }
    }
}
