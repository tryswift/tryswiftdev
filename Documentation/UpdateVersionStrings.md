# Version Strings Updater ✨ (Coming soon)

### _**Make Easy for You to Update Version Strings in Specified Files**_

<br />

### A Work In Progress 👷

⚠️ **Please note!**

This is still in early design and development. 🙏

<br />

## Example

### Preparing for Update Version Strings

Please set the following format to a configuration file. (e.g. `tryswiftdev.uvs`)

```
<YourFilePath>, <RegularExpression>, <NewString>
```

### A Specific Example (testTryswiftdev.uvs)

```
./tryswiftdevtest/AfterTheUpdate/testFindIt.swift, \"TOOLCHAINS=org.swift.[0-9]\{10\}a\", \"TOOLCHAINS=org.swift.3020171225a\"
./tryswiftdevtest/AfterTheUpdate/testFindIt.swift, swift-DEVELOPMENT-SNAPSHOT-[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}-a, swift-DEVELOPMENT-SNAPSHOT-2017-12-25-a

./tryswiftdevtest/AfterTheUpdate/testFindIt.md, swift-DEVELOPMENT-SNAPSHOT-[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}-a, swift-DEVELOPMENT-SNAPSHOT-2017-12-25-a

./tryswiftdevtest/AfterTheUpdate/testFindItTests.swift, swift-DEVELOPMENT-SNAPSHOT-[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}-a, swift-DEVELOPMENT-SNAPSHOT-2017-12-25-a

./tryswiftdevtest/AfterTheUpdate/.travis.yml, osx_image:\ xcode[0-9].[0-9], osx_image:\ xcode8.0
./tryswiftdevtest/AfterTheUpdate/.travis.yml, swift-DEVELOPMENT-SNAPSHOT-[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}-a, swift-DEVELOPMENT-SNAPSHOT-2017-12-25-a
```

<br />

### Executing Update via _tryswiftdev_

```
$ tryswiftdev -u ? ?
```

<br />

### Result 😇

```
$ git diff
```

```diff
5,6c5,6
<     "TOOLCHAINS=org.swift.3020160425a",
<     "XCODE_DEFAULT_TOOLCHAIN_OVERRIDE=/Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-2017-12-25-a.xctoolchain",
---
>     "TOOLCHAINS=org.swift.3020160503a",
>     "XCODE_DEFAULT_TOOLCHAIN_OVERRIDE=/Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a.xctoolchain",

4c4
<   - /Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-2016-04-25-a.xctoolchain/usr/lib/sourcekitd.framework
---
>   - /Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a.xctoolchain/usr/lib/sourcekitd.framework
7c7
<   - /Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-2016-04-25-a.xctoolchain/usr/lib/swift/macosx
---
>   - /Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a.xctoolchain/usr/lib/swift/macosx
15c15
< - `/Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-2016-04-25-a.xctoolchain/usr/lib`
---
> - `/Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a.xctoolchain/usr/lib`
17c17
< Recommend swift-DEVELOPMENT-SNAPSHOT-2016-04-25-a.
---
> Recommend swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a.

11c11
<         XCTAssertEqual(xcodebuildSettings["LD_RUNPATH_SEARCH_PATHS"], "/Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-2016-04-25-a.xctoolchain/usr/lib/swift/macosx")
---
>         XCTAssertEqual(xcodebuildSettings["LD_RUNPATH_SEARCH_PATHS"], "/Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a.xctoolchain/usr/lib/swift/macosx")
18c18
<             runpathSearchPaths: "/Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-2016-04-25-a.xctoolchain/usr/lib/swift/macosx",
---
>             runpathSearchPaths: "/Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a.xctoolchain/usr/lib/swift/macosx",

2c2
< osx_image: xcode7.2
---
> osx_image: xcode7.3
8c8
<   - export SWIFT_VERSION=swift-DEVELOPMENT-SNAPSHOT-2016-04-25-a
---
>   - export SWIFT_VERSION=swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a
```

<br />

## Others

### Support CocoaPods

```
./tryswiftdevtest/AfterTheUpdate/testTryswiftdev.podspec, s.version\ \ \ \ \ =\ \"[0-9].[0-9].[0-9]", s.version\ \ \ \ \ =\ \"3.1.2\"
./tryswiftdevtest/AfterTheUpdate/testTryswiftdev.podspec, s.osx.deployment_target\ =\ \"[0-9]\{2\}.[0-9]\", s.osx.deployment_target\ =\ \"10.9\"
./tryswiftdevtest/AfterTheUpdate/testTryswiftdev.podspec, s.ios.deployment_target\ =\ \"[0-9].[0-9]\", s.ios.deployment_target =\ \"8.0\"
./tryswiftdevtest/AfterTheUpdate/testTryswiftdev.podspec, s.tvos.deployment_target\ =\ \"[0-9].[0-9]", s.tvos.deployment_target =\ \"9.0\"
./tryswiftdevtest/AfterTheUpdate/testTryswiftdev.podspec, s.watchos.deployment_target\ =\ \"[0-9].[0-9]\", s.watchos.deployment_target\ =\ \"2.0\"
```

### Support Carthage

```
./tryswiftdevtest/AfterTheUpdate/Cartfile,  github\ \"ishkawa\/APIKit\"\ \"[0-9].[0-9].[0-9]\",  github\ \"ishkawa\/APIKit\"\ \"2.0.0\"
./tryswiftdevtest/AfterTheUpdate/Cartfile,  github\ \"ikesyo\/Himotoki\"\ \"[0-9].[0-9].[0-9]\",  github\ \"ikesyo\/Himotoki\"\ \"2.0.0\"
./tryswiftdevtest/AfterTheUpdate/Cartfile.private, github\ \"jspahrsummers\/xcconfigs\"\ \"[a-z0-9]\{7\}\", github\ \"jspahrsummers\/xcconfigs\"\ \"8ed0ba2\"
```

### Support swiftenv

```
./tryswiftdevtest/AfterTheUpdate/.swift-version, DEVELOPMENT-SNAPSHOT-[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}-a, DEVELOPMENT-SNAPSHOT-2016-05-03-a
```

### Result

```diff
1c1
<   s.version      = "1.7.0"
---
>   s.version      = "2.0.0"
3,6c3,6
<   s.osx.deployment_target = "10.8"
<   s.ios.deployment_target = "7.0"
<   s.tvos.deployment_target = "8.0"
<   s.watchos.deployment_target = "1.1"
---
>   s.osx.deployment_target = "10.9"
>   s.ios.deployment_target = "8.0"
>   s.tvos.deployment_target = "9.0"
>   s.watchos.deployment_target = "2.0"

1,2c1,2
< github "ishkawa/APIKit" "1.7.0"
< github "ikesyo/Himotoki" "1.7.0"
---
> github "ishkawa/APIKit" "2.0.0"
> github "ikesyo/Himotoki" "2.0.0"

1c1
< github "jspahrsummers/xcconfigs" "7fe1cb3"
---
> github "jspahrsummers/xcconfigs" "8ed0ba2"

1c1
< DEVELOPMENT-SNAPSHOT-2016-04-25-a
---
> DEVELOPMENT-SNAPSHOT-2016-05-03-a
```

<br />

## Availability

Recommented Swift 3.0-dev.

<br />

## ToDo

- [ ] Error Handling
- [ ] Tests

etc.
