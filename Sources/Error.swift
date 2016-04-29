#if swift(>=3.0)
#else
    typealias ErrorProtocol = ErrorType
#endif

enum Error: ErrorProtocol {
    case InvalidValue
}

extension Error: CustomStringConvertible {
    var description: String {
        switch self {
        case .InvalidValue:
            return "Please input [option <value> ...]."
        }
    }
}
