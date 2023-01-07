[![License][license badge]][license]
[![Platforms][platforms badge]][platforms]
[![Documentation][documentation badge]][documentation]

# UITestingPlus
Utilities for working with XCUI testing.

## Integration

```swift
dependencies: [
    .package(url: "https://github.com/ChimeHQ/UITestingPlus", branch: "main")
]
```

## XCUIApplication Extensions

### Menus

```swift
var windowMenuItemTitles: [String]
var windowMenuItemWindowTitles: [String]
var recentMenuItemTitles: [String]
```

### Windows

```swift
func launchWithNoWindows()
func closeExistingWindows()
var frontWindow: XCUIElement
func resetLaunchEnvironmentAndArguments()
func quit()
```

### Documents

```swift
func saveFrontmostDocument() throws
func closeFrontmostDocument() throws
func createNewDocument() throws
func saveDocument(in window: XCUIElement) throws
func saveDocument(in window: XCUIElement, to url: URL, overwrite: Bool = true) throws
func openDocument(with url: URL) -> XCUIElement
```

## XCUIElement Extensions

### Text Editing

```swift
func replaceTextWith(_ string: String)
func replaceTextWithPasteboard()
func appendText(_ string: String)
func deleteText()

func stringValue(in range: NSRange? = nil) throws -> String
func navigateTextView(to line: Int, column: Int) throws
```

### Existance

```swift
func waitForNonExistence(timeout: TimeInterval) -> Bool
```

## Classes

- `HittableElementExpectation`

## Suggestions or Feedback

We'd love to hear from you! Get in touch via [twitter](https://twitter.com/chimehq), an issue, or a pull request.

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

[license]: https://opensource.org/licenses/BSD-3-Clause
[license badge]: https://img.shields.io/github/license/ChimeHQ/UITestingPlus
[platforms]: https://swiftpackageindex.com/ChimeHQ/UITestingPlus
[platforms badge]: https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FChimeHQ%2FUITestingPlus%2Fbadge%3Ftype%3Dplatforms
[documentation]: https://swiftpackageindex.com/ChimeHQ/UITestingPlus/main/documentation
[documentation badge]: https://img.shields.io/badge/Documentation-DocC-blue
