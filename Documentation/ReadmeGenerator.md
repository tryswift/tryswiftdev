# README Generator

### _Make Easy for You to Create a README.md of New Project_

- _**Duplicate an existing README.md**_
- _**Replace Strings (e.g. Name) in a README.md**_

<br />

<img src="./Images/ReadmeGenerator.gif">

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
$ tryswiftdev -d ./Pokemon ./DragonBall
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

Recommented Swift 3.0-dev.

<br />

## ToDo

- [ ] Error Handling
- [ ] Tests

etc.

<br />

## License

Licensed under the [MIT License](LICENSE).
