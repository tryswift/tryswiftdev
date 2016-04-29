# tryswiftdev 🛠

This is a command line tool for open-source projects. 💁

Currently, support **OS X only**. 🙏

<br />

### A Work In Progress

This project has been rewriting in _**Swift**_.

It is built with the _**Swift Package Manager**_.

Maybe it is easily to write a shell (e.g. Bash), _but this is exactly **"try! Swift"**._

<br />

<img src="./Documentation/Images/tryswiftdev.png">

<br />

## Installing (Coming soon)

Please download the `tryswiftdev.pkg` in the [Releases](https://github.com/tryswift/tryswiftdev/releases) and install it.

By default, get `tryswiftdev` into the `/usr/local/bin/` directory.

You can verify your installation by typing `tryswiftdev` in a Terminal.app.

```
$ tryswiftdev
```

<br />

## Options

```
-d [--duplicate-readme]    Duplicate an existing README.md.
                           Do not overwrite an existing file.
-r [--replace-readme]      Replace strings in a README.md
                           located in the current directory.
-h [--help]                Display available options.
```

<br />

## Example

Please prepare a target directory beforehand. (e.g. `DragonBall`)

```
HomeDirectory
├── Pokemon
│   └── README.md (Pokemon)
└── DragonBall
```

<br />

### Duplicating a README.md

```bash
$ tryswiftdev -d ../Pokemon ../DragonBall
```

```
HomeDirectory
├── Pokemon
│   └── README.md (Pokemon)
└── DragonBall
    └── README.md (Pokemon) ✨
```

<br />

### Replacing Strings in a README.md

```bash
$ cd DragonBall
$ tryswiftdev -r Pokemon DragonBall
```

```
HomeDirectory
├── Pokemon
│   └── README.md (Pokemon)
└── DragonBall
    └── README.md (DragonBall) ✨
```

<br />

## Availability

Recommend Swift 3.0-dev.

<br />

## ToDo

- [ ] Error Handling
- [ ] Tests

etc.

<br />

## License

Licensed under the [MIT License](LICENSE).
