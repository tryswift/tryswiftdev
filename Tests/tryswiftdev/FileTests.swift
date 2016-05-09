@testable import tryswiftdev
import FounDarwin
import XCTest

private var cd = String()
private let testDirectoryName = "tryswiftdevtest"
private let beforeUpdateDirectoryName = "BeforeUpdate"
private let afterUpdateDirectoryName = "AfterUpdate"
private let configurationFileName = "testTryswiftdev.uvs"
private let configurationFileNameForReset = "testTryswiftdev.uvsr"
private let configurationFileNameOneLine = "testTryswiftdevOneLine.uvs"
private let configurationFileNameOneLineForReset = "testTryswiftdevOneLine.uvsr"

final class FileTests: XCTestCase {
    override func setUp() {
        super.setUp()
        do {
            cd = try FounDarwin.currentDirectoryPath()
        } catch {
            XCTFail()
            return
        }
    }
    
    func testReadVersionStringsInfoOneLine() {
        // TODO: Support `Forget \n`
        let filePath = "\(cd)/\(testDirectoryName)/\(configurationFileNameOneLine)"
        guard let versionStringsInfos = readVersionStringsInfo(fullPath: filePath) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(versionStringsInfos.first?.filePath, "./\(testDirectoryName)/\(afterUpdateDirectoryName)/testFindItOneLine.swift")
        XCTAssertEqual(versionStringsInfos.first?.regularExpression, "org.swift.[0-9]\\{10\\}a")
        XCTAssertEqual(versionStringsInfos.first?.newString, "org.swift.3020171225a")
    }
    
    func testReadVersionStringsInfo() {
        let filePath = "\(cd)/\(testDirectoryName)/\(configurationFileName)"
        guard let versionStringsInfos = readVersionStringsInfo(fullPath: filePath) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(versionStringsInfos.first?.filePath, "./\(testDirectoryName)/\(afterUpdateDirectoryName)/testFindIt.swift")
        XCTAssertEqual(versionStringsInfos.first?.regularExpression, "\\\"TOOLCHAINS=org.swift.[0-9]\\{10\\}a\\\"")
        XCTAssertEqual(versionStringsInfos.first?.newString, "\\\"TOOLCHAINS=org.swift.3020171225a\\\"")
        
        XCTAssertEqual(versionStringsInfos.dropFirst().first?.filePath, "./\(testDirectoryName)/\(afterUpdateDirectoryName)/testFindIt.swift")
        XCTAssertEqual(versionStringsInfos.dropFirst().first?.regularExpression, "swift-DEVELOPMENT-SNAPSHOT-[0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\}-a")
        XCTAssertEqual(versionStringsInfos.dropFirst().first?.newString, "swift-DEVELOPMENT-SNAPSHOT-2017-12-25-a")
        
        XCTAssertEqual(versionStringsInfos.dropFirst(2).first?.filePath, "./\(testDirectoryName)/\(afterUpdateDirectoryName)/testFindIt.md")
        XCTAssertEqual(versionStringsInfos.dropFirst(2).first?.regularExpression, "swift-DEVELOPMENT-SNAPSHOT-[0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\}-a")
        XCTAssertEqual(versionStringsInfos.dropFirst(2).first?.newString, "swift-DEVELOPMENT-SNAPSHOT-2017-12-25-a")
        
        XCTAssertEqual(versionStringsInfos.dropFirst(3).first?.filePath, "./\(testDirectoryName)/\(afterUpdateDirectoryName)/testFindItTests.swift")
        XCTAssertEqual(versionStringsInfos.dropFirst(3).first?.regularExpression, "swift-DEVELOPMENT-SNAPSHOT-[0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\}-a")
        XCTAssertEqual(versionStringsInfos.dropFirst(3).first?.newString, "swift-DEVELOPMENT-SNAPSHOT-2017-12-25-a")
        
        XCTAssertEqual(versionStringsInfos.dropFirst(4).first?.filePath, "./\(testDirectoryName)/\(afterUpdateDirectoryName)/.travis.yml")
        XCTAssertEqual(versionStringsInfos.dropFirst(4).first?.regularExpression, "osx_image:\\ xcode[0-9].[0-9]")
        XCTAssertEqual(versionStringsInfos.dropFirst(4).first?.newString, "osx_image:\\ xcode8.0")
        
        XCTAssertEqual(versionStringsInfos.dropFirst(5).first?.filePath, "./\(testDirectoryName)/\(afterUpdateDirectoryName)/.travis.yml")
        XCTAssertEqual(versionStringsInfos.dropFirst(5).first?.regularExpression, "swift-DEVELOPMENT-SNAPSHOT-[0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\}-a")
        XCTAssertEqual(versionStringsInfos.dropFirst(5).first?.newString, "swift-DEVELOPMENT-SNAPSHOT-2017-12-25-a")
        
        XCTAssertEqual(versionStringsInfos.dropFirst(6).first?.filePath, "./\(testDirectoryName)/\(afterUpdateDirectoryName)/testTryswiftdev.podspec")
        XCTAssertEqual(versionStringsInfos.dropFirst(6).first?.regularExpression, "s.version\\ \\ \\ \\ \\ \\ =\\ \\\"[0-9].[0-9].[0-9]\\\"")
        XCTAssertEqual(versionStringsInfos.dropFirst(6).first?.newString, "s.version\\ \\ \\ \\ \\ \\ =\\ \\\"3.1.2\\\"")
        
        XCTAssertEqual(versionStringsInfos.dropFirst(7).first?.filePath, "./\(testDirectoryName)/\(afterUpdateDirectoryName)/testTryswiftdev.podspec")
        XCTAssertEqual(versionStringsInfos.dropFirst(7).first?.regularExpression, "s.osx.deployment_target\\ =\\ \\\"[0-9]\\{2\\}.[0-9]\\\"")
        XCTAssertEqual(versionStringsInfos.dropFirst(7).first?.newString, "s.osx.deployment_target\\ =\\ \\\"11.0\\\"")
        
        XCTAssertEqual(versionStringsInfos.dropFirst(8).first?.filePath, "./\(testDirectoryName)/\(afterUpdateDirectoryName)/testTryswiftdev.podspec")
        XCTAssertEqual(versionStringsInfos.dropFirst(8).first?.regularExpression, "s.ios.deployment_target\\ =\\ \\\"[0-9].[0-9]\\\"")
        XCTAssertEqual(versionStringsInfos.dropFirst(8).first?.newString, "s.ios.deployment_target =\\ \\\"9.1\\\"")
        
        XCTAssertEqual(versionStringsInfos.dropFirst(9).first?.filePath, "./\(testDirectoryName)/\(afterUpdateDirectoryName)/testTryswiftdev.podspec")
        XCTAssertEqual(versionStringsInfos.dropFirst(9).first?.regularExpression, "s.tvos.deployment_target\\ =\\ \\\"[0-9].[0-9]\"")
        XCTAssertEqual(versionStringsInfos.dropFirst(9).first?.newString, "s.tvos.deployment_target =\\ \\\"8.2\\\"")
        
        XCTAssertEqual(versionStringsInfos.dropFirst(10).first?.filePath, "./\(testDirectoryName)/\(afterUpdateDirectoryName)/testTryswiftdev.podspec")
        XCTAssertEqual(versionStringsInfos.dropFirst(10).first?.regularExpression, "s.watchos.deployment_target\\ =\\ \\\"[0-9].[0-9]\\\"")
        XCTAssertEqual(versionStringsInfos.dropFirst(10).first?.newString, "s.watchos.deployment_target\\ =\\ \\\"3.1\\\"")
        
        XCTAssertEqual(versionStringsInfos.dropFirst(11).first?.filePath, "./\(testDirectoryName)/\(afterUpdateDirectoryName)/Cartfile")
        XCTAssertEqual(versionStringsInfos.dropFirst(11).first?.regularExpression, "github\\ \\\"ishkawa\\/APIKit\\\"\\ \\\"[0-9].[0-9].[0-9]\\\"")
        XCTAssertEqual(versionStringsInfos.dropFirst(11).first?.newString, "github\\ \\\"ishkawa\\/APIKit\\\"\\ \\\"3.4.5\\\"")
        
        XCTAssertEqual(versionStringsInfos.dropFirst(12).first?.filePath, "./\(testDirectoryName)/\(afterUpdateDirectoryName)/Cartfile")
        XCTAssertEqual(versionStringsInfos.dropFirst(12).first?.regularExpression, "github\\ \\\"ikesyo\\/Himotoki\\\"\\ \\\"[0-9].[0-9].[0-9]\\\"")
        XCTAssertEqual(versionStringsInfos.dropFirst(12).first?.newString, "github\\ \\\"ikesyo\\/Himotoki\\\"\\ \\\"4.5.6\\\"")
        
        XCTAssertEqual(versionStringsInfos.dropFirst(13).first?.filePath, "./\(testDirectoryName)/\(afterUpdateDirectoryName)/Cartfile.private")
        XCTAssertEqual(versionStringsInfos.dropFirst(13).first?.regularExpression, "github\\ \\\"jspahrsummers\\/xcconfigs\\\"\\ \\\"[a-z0-9]\\{7\\}\\\"")
        XCTAssertEqual(versionStringsInfos.dropFirst(13).first?.newString, "github\\ \\\"jspahrsummers\\/xcconfigs\\\"\\ \\\"9fe1cb3\\\"")
        
        XCTAssertEqual(versionStringsInfos.dropFirst(14).first?.filePath, "./\(testDirectoryName)/\(afterUpdateDirectoryName)/.swift-version")
        XCTAssertEqual(versionStringsInfos.dropFirst(14).first?.regularExpression, "DEVELOPMENT-SNAPSHOT-[0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\}-a")
        XCTAssertEqual(versionStringsInfos.dropFirst(14).first?.newString, "DEVELOPMENT-SNAPSHOT-2017-12-25-a")
    }
}

func compareFile(path afterFilePath: String, to beforeFilePath: String) {
    guard let diff = FounDarwin.executeCommand(argments: ["diff", afterFilePath, beforeFilePath]) else {
        XCTFail()
        return
    }
    print(diff)
}

extension ReadmeTests {
    // TODO:
}

extension VersionTests {
    override func tearDown() {
        try! updateVersionStrings(configurationFileFullPath: "\(cd)/\(testDirectoryName)/\(configurationFileNameOneLineForReset)", rootDirectoryPath: "\(cd)")
        try! updateVersionStrings(configurationFileFullPath: "\(cd)/\(testDirectoryName)/\(configurationFileNameForReset)", rootDirectoryPath: "\(cd)")
        super.tearDown()
    }
    
    func testUpdateVersionStringsOneLine() {
        try! updateVersionStrings(configurationFileFullPath: "\(cd)/\(testDirectoryName)/\(configurationFileNameOneLine)", rootDirectoryPath: "\(cd)")
        
        let targetFiles = [
                              "testFindItOneLine.swift",
        ]
        
        targetFiles.forEach {
            let targetFullPath = "\(cd)/\(testDirectoryName)/\(afterUpdateDirectoryName)/\($0)"
            let beforeChangeFilePath = "\(cd)/\(testDirectoryName)/\(beforeUpdateDirectoryName)/\($0)"
            // TODO: How to test
            compareFile(path: targetFullPath, to: beforeChangeFilePath)
        }
    }
    
    func testUpdateVersionStrings() {
        try! updateVersionStrings(configurationFileFullPath: "\(cd)/\(testDirectoryName)/\(configurationFileName)", rootDirectoryPath: "\(cd)")
        
        let targetFiles = [
                              "testFindIt.swift",
                              "testFindIt.md",
                              "testFindItTests.swift",
                              ".travis.yml",
                              "testTryswiftdev.podspec",
                              "Cartfile",
                              "Cartfile.private",
                              ".swift-version"
        ]
        
        targetFiles.forEach {
            let targetFullPath = "\(cd)/\(testDirectoryName)/\(afterUpdateDirectoryName)/\($0)"
            let beforeChangeFilePath = "\(cd)/\(testDirectoryName)/\(beforeUpdateDirectoryName)/\($0)"
            compareFile(path: targetFullPath, to: beforeChangeFilePath)
        }
    }
}
