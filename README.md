[![License][license badge]][license]

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
