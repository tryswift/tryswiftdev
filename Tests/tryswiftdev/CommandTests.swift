@testable import tryswiftdev
import XCTest

final class CommandTests: XCTestCase {
    func testExecuteCommandNil() {
        let export = executeCommand(argments: ["export", "PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:\"${PATH}\""])
        XCTAssertNil(export)
    }
    
    func testExecuteCommandNotNil() {
        guard let ls = executeCommand(argments: ["ls"]) else {
            XCTFail()
            return
        }
        XCTAssertNotNil(ls)
    }
}
