[![License][license badge]][license]
[![Platforms][platforms badge]][platforms]
[![Documentation][documentation badge]][documentation]

# UITestingPlus
Utilities for working with XCUI testing

## Integration

```swift
dependencies: [
    .package(url: "https://github.com/ChimeHQ/UITestingPlus", branch: "main")
]
```

## Usage

### Controlling Launch-Time Window State

```swift
class MyTests: XCTestCase {
    lazy var app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        app.launchWithNoWindows()
        app.resetLaunchEnvironmentAndArguments()
    }
```

## Suggestions or Feedback

We'd love to hear from you! Get in touch via [twitter](https://twitter.com/chimehq), an issue, or a pull request.

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

[license]: https://opensource.org/licenses/BSD-3-Clause
[license badge]: https://img.shields.io/github/license/ChimeHQ/UITestingPlus
[platforms]: https://swiftpackageindex.com/ChimeHQ/UITestingPlus
[platforms badge]: https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FChimeHQ%2FUITestingPlus%2Fbadge%3Ftype%3Dplatforms
[documentation]: https://swiftpackageindex.com/ChimeHQ/UITestingPlus/main/documentation
[documentation badge]: https://img.shields.io/badge/Documentation-DocC-blue
