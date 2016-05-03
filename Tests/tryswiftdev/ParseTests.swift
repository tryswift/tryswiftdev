@testable import tryswiftdev
import XCTest

final class ParseTests: XCTestCase {
    func testParseToArray1() {
        XCTAssertEqual(parseToArray(source: "try!\nSwift"), ["try!", "Swift"])
    }
    
    func testParseToArray2() {
        XCTAssertEqual(parseToArray(source: "try!\nSwift\n2016"), ["try!", "Swift", "2016"])
    }
}
