@testable import tryswiftdev
import XCTest

final class ParseTests: XCTestCase {
    func testParseToArrayTwo() {
        XCTAssertEqual(parseToArray(source: "try!\nSwift"), ["try!", "Swift"])
    }
    
    func testParseToArrayThree() {
        XCTAssertEqual(parseToArray(source: "try!\nSwift\n2016"), ["try!", "Swift", "2016"])
    }
}
