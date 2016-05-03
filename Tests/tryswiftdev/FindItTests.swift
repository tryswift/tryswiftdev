@testable import tryswiftdev
import XCTest

final class FindItTests: XCTestCase {
    func testGetXcodeBuildSettings() {
        guard let xcodebuildSettings = getXcodeBuildSettings() else {
            XCTFail()
            return
        }
        // FIXME: Hard-coding
        XCTAssertEqual(xcodebuildSettings["LD_RUNPATH_SEARCH_PATHS"], "/Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a.xctoolchain/usr/lib/swift/macosx")
        XCTAssertNil(xcodebuildSettings["FRAMEWORK_SEARCH_PATHS"])
    }
    
    func testSearchFileFound() {
        guard let sourcekitdPaths = searchFile(targetOption: "-name", targetName: "sourcekitd.framework") else {
            XCTFail()
            return
        }
        XCTAssertTrue(sourcekitdPaths.contains("/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/sourcekitd.framework"))
    }
    
    func testSearchFileNotFound() {
        guard let sourcekitdPaths = searchFile(targetOption: "-name", targetName: "sourcekitd.framewor") else {
            XCTFail()
            return
        }
        XCTAssertTrue(sourcekitdPaths.isEmpty)
    }
    
    func testDisplayResult() {
        // FIXME: Hard-coding
        displayResult(
            sources: ["/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/sourcekitd.framework"],
            runpathSearchPaths: "/Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a.xctoolchain/usr/lib/swift/macosx",
            frameworkSearchPaths: nil
        )
    }
}
