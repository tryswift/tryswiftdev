# Find It 🔍

### A Work In Progress 👷

For now, support `$ tryswiftdev -f -name <value>` only. 🙏

<br />

<img src="./Images/FindIt.png">

<br />

## Example

### Building your project _Pokemon_ with Xcode

```
ld: framework not found sourcekitd
clang: error: linker command failed with exit code 1 (use -v to see invocation)
```

### 🤔

<br />

### Running your project _Pokemon_ with Xcode

```
dyld: Library not loaded: @rpath/sourcekitd.framework/Versions/A/sourcekitd
  Referenced from: /usr/local/bin/pokemon
  Reason: image not found
```

### 🙄

<br />

### Finding it with _tryswiftdev_

```bash
$ tryswiftdev -f -name sourcekitd.framework
```

```
Searching... /Applications/Xcode.app/Contents
Searching... /Library/Developer
Searching... /Library/Frameworks

Found it!

  - /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/sourcekitd.framework

  - /Library/Developer/Toolchains/swift-2.2-SNAPSHOT-2016-03-01-a.xctoolchain/usr/lib/sourcekitd.framework

  - /Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-2016-04-25-a.xctoolchain/usr/lib/sourcekitd.framework


(Check your `Runpath Search Paths`, `Framework Search Paths`, etc.)
```

### 😇

<br />

## ToDo

- [ ] Error Handling
- [ ] Tests

etc.
