# Updating Version Strings in Specified Files ✨ 

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

### A Specific Example (for tryswiftdev)

```
./Sources/FindIt.swift, org.swift.[0-9]\{10\}a, org.swift.3020160503a
./Sources/FindIt.swift, swift-DEVELOPMENT-SNAPSHOT-[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}-a, swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a
./Documentation/FindIt.md, swift-DEVELOPMENT-SNAPSHOT-[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}-a, swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a
./Documentation/UpdateVersionStrings.md, swift-DEVELOPMENT-SNAPSHOT-[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}-a, swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a
.travis.yml, osx_image:\ xcode[0-9].[0-9], osx_image:\ xcode7.3
.travis.yml, swift-DEVELOPMENT-SNAPSHOT-[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}-a, swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a
./Tests/tryswiftdev/FindItTests.swift, swift-DEVELOPMENT-SNAPSHOT-[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}-a, swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a
```

<br />

### Executing Update via _tryswiftdev_

```
$ tryswiftdev -u ? <ConfigurationFileAbsolutePath>
```

<br />

### Result 😇

```
$ git diff
```

```diff
...
-  - /Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-2016-04-25-a.xctoolchain/usr/lib/sourcekitd.framework
+  - /Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a.xctoolchain/usr/lib/sourcekitd.framework
...
-osx_image: xcode7.2
+osx_image: xcode7.3
...
-  - export SWIFT_VERSION=swift-DEVELOPMENT-SNAPSHOT-2016-04-25-a
+  - export SWIFT_VERSION=swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a
...
```

<br />

## Others

### Support Swift Package Manager

```
Package.swift,
```

### Support CocoaPods

```
Pokemon.podspec, s.version\ \ \ \ \ =\ \"[0-9]\{1,\}.[0-9]\{1,\}.[0-9]\{1,\}\", s.version\ \ \ \ \ =\ \"2.0.0\"
Pokemon.podspec, s.osx.deployment_target\ =\ \"[0-9]\{1,\}.[0-9]\{1,\}\", s.osx.deployment_target\ =\ \"10.9\"
Pokemon.podspec, s.ios.deployment_target\ =\ \"[0-9]\{1,\}.[0-9]\{1,\}\", s.ios.deployment_target =\ \"8.0\"
Pokemon.podspec, s.tvos.deployment_target\ =\ \"[0-9]\{1,\}.[0-9]\{1,\}\", s.tvos.deployment_target =\ \"9.0\"
Pokemon.podspec, s.watchos.deployment_target\ =\ \"[0-9]\{1,\}.[0-9]\{1,\}\", s.watchos.deployment_target\ =\ \"2.0\"
```

### Support Carthage

```
Cartfile,
Cartfile.private, github\ \"jspahrsummers/xcconfigs"\ \"[0-9a-z]\{7\}\", github\ \"jspahrsummers/xcconfigs\" \"8ed0ba2\"
```

### Support swiftenv

```
.swift-version, DEVELOPMENT-SNAPSHOT-[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}-a, DEVELOPMENT-SNAPSHOT-2016-03-01-a
```

<br />

## Requirement

Recommend swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a.

<br />

## ToDo

- [ ] Error Handling
- [ ] Tests

etc.
