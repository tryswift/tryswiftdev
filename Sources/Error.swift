#if swift(>=3.0)
#else
    typealias ErrorProtocol = ErrorType
#endif

enum Error: ErrorProtocol {
    case InvalidValue
    case UnsupportedOption
}

extension Error: CustomStringConvertible {
    var description: String {
        switch self {
        case .InvalidValue:
            return "Please input [option <value> ...]."
        case .UnsupportedOption:
            return "Please input `tryswift -f -name <value>`."
        }
    }
}
