@testable import tryswiftdev
import XCTest

final class CommandTests: XCTestCase {
    func testExecuteCommand() {
        guard let ls = executeCommand(argments: ["ls"]) else {
            XCTFail()
            return
        }
        XCTAssertNotNil(ls)
    }
}
