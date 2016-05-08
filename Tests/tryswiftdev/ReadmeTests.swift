@testable import tryswiftdev
import XCTest

final class ReadmeTests: XCTestCase {
    
    private let testDirectoryName = "tryswiftdevtest"
    private let readmeFileName = "README.md"
    
    override func tearDown() {
        removeFile(path: "./\(testDirectoryName)/\(readmeFileName)")
        super.tearDown()
    }
    
    func testDuplicateExistingReadme() {
        duplicateExistingReadme(existingReadmeDirctoryPath: ".", newReadmeDirectoryPath: "./\(testDirectoryName)")
        // TODO: Verify new README.md exists.
    }
    
    func testReplaceStringsInReadme() {
        // TODO:
    }
}
