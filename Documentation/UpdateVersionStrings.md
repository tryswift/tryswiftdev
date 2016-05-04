# Updating Version Strings in Specified Files ✨ (Coming Soon)

### A Work In Progress 👷

⚠️ **Please note!**

This is still in early design and development. 🙏

<br />

## Example

### Preparing to Update Version Strings

Please set to a configuration file.

e.g.

```
<YourFilePath>, <RegularExpression>, <NewString>
```

```
./Sources/FindIt.swift, org.swift.30[0-9]\{8\}a, org.swift.3020160503a
./Sources/FindIt.swift, swift-DEVELOPMENT-SNAPSHOT-[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}-a, swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a
./Documentation/FindIt.md, swift-DEVELOPMENT-SNAPSHOT-[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}-a, swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a
./Documentation/UpdateVersionStrings.md, swift-DEVELOPMENT-SNAPSHOT-[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}-a, swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a
.travis.yml, swift-DEVELOPMENT-SNAPSHOT-[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}-a, swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a
Tests/tryswiftdev/FindItTests.swift, SNAPSHOT-[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}-a, swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a
```

<br />

### Executing Update via _tryswiftdev_

```
$ tryswiftdev -? ? ?
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
-  - export SWIFT_VERSION=swift-DEVELOPMENT-SNAPSHOT-2016-04-25-a
+  - export SWIFT_VERSION=swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a
...
```

<br />

## Requirement

Recommend swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a.

<br />

## ToDo

- [ ] Error Handling
- [ ] Tests

etc.
