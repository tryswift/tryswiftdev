@testable import tryswiftdev
import XCTest

final class FindItTests: XCTestCase {
    func testGetXcodeBuildSettings() {
        guard let xcodebuildSettings = getXcodeBuildSettings() else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(xcodebuildSettings["LD_RUNPATH_SEARCH_PATHS"], "/Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a.xctoolchain/usr/lib/swift/macosx")
        XCTAssertNil(xcodebuildSettings["FRAMEWORK_SEARCH_PATHS"])
    }
     
    func testDisplayResult() {
        displayResult(
            sources: ["/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/sourcekitd.framework"],
            runpathSearchPaths: "/Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a.xctoolchain/usr/lib/swift/macosx",
            frameworkSearchPaths: nil
        )
    }
}
