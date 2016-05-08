@testable import tryswiftdev
import XCTest

final class VersionTests: XCTestCase {
    func testReplaceStrings() {
        replaceStrings(in: "./tryswiftdevtest/testFindItForVersionTests.swift", regularExpression: "org.swift.[0-9]\\{10\\}a", newString: "org.swift.3020171225a")
        replaceStrings(in: "./tryswiftdevtest/testFindItForVersionTests.swift", regularExpression: "org.swift.[0-9]\\{10\\}a", newString: "org.swift.3020160503a")
    }
}
