@testable import tryswiftdev
import XCTest
// TODO: import Darwin
import Foundation

/// Use Foundation for now.
final class ReadmeTests: XCTestCase {
    
    let fileManager = NSFileManager.default()
    
    override func setUp() {
        super.setUp()
        do {
            try fileManager.createDirectory(at: NSURL(fileURLWithPath: "\(fileManager.currentDirectoryPath)/tmp", isDirectory: true), withIntermediateDirectories: true, attributes: nil)
        } catch {
            XCTFail()
            return
        }
    }
    
    override func tearDown() {
        do {
            try fileManager.removeItem(atPath: "\(fileManager.currentDirectoryPath)/tmp")
        } catch {
            XCTFail()
        }
        super.tearDown()
    }
    
    func testDuplicateExistingReadme() {
        duplicateExistingReadme(existingReadmeDirctoryPath: ".", newReadmeDirectoryPath: "./tmp")
        XCTAssertTrue(fileManager.fileExists(atPath: "\(fileManager.currentDirectoryPath)/tmp/README.md"))
    }
    
    func testReplaceStringsInReadme() {
        // TODO:
    }
}
