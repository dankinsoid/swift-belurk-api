# BelurkAPI
This package provides a Swift API for the [Belurk](https://belurk.ru)

## Example

```swift
let api = BelurkAPI()
let proxies = try await api.proxy.getAll().collect()
```
## Usage

 
## Installation

1. [Swift Package Manager](https://github.com/apple/swift-package-manager)

Create a `Package.swift` file.
```swift
// swift-tools-version:5.9
import PackageDescription

let package = Package(
  name: "SomeProject",
  dependencies: [
    .package(url: "https://github.com/dankinsoid/BelurkAPI.git", from: "1.0.0")
  ],
  targets: [
    .target(name: "SomeProject", dependencies: ["BelurkAPI"])
  ]
)
```
```ruby
$ swift build
```

## Author

dankinsoid, voidilov@gmail.com

## License

BelurkAPI is available under the MIT license. See the LICENSE file for more info.
