import PackageDescription

let package = Package(
    name: "tryswiftdev",
    targets: [
        Target(name: "tryswiftdev")
    ],
    exclude: ["Documentation", "testTryswiftdev"]
)
