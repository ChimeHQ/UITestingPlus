import Foundation
import XCTest

#if os(macOS)
public extension XCUIElement {
    /// Replaces the existing text in a field with the given text.
	func replaceTextWith(_ string: String) {
        click()
        typeKey("a", modifierFlags: .command)
        typeText(string)
    }

    /// Replaces the existing text in a field with the contents of the pasteboard.
    func replaceTextWithPasteboard() {
        click()
        typeKey("a", modifierFlags: .command)
        typeKey("v", modifierFlags: .command)
    }

    /// Appends the given text to the existing text in a text field.
    func appendText(_ string: String) {
        click()
        typeKey(.downArrow, modifierFlags: .command)
        typeKey(.rightArrow, modifierFlags: .command)
        typeText(string)
    }

    /// Deletes the current text in a text field.
    func deleteText() {
        click()
        typeKey("a", modifierFlags: .command)
        typeKey(.delete, modifierFlags: [])
    }
}
#endif

enum XCUIElementError: Error {
	case noStringValue
}

public extension XCUIElement {
	func stringValue(in range: NSRange? = nil) throws -> String {
		guard let stringValue = self.value as? NSString else {
			XCTFail("unable to read string value")
			throw XCUIElementError.noStringValue
		}

		guard let r = range else {
			return stringValue as String
		}

		return stringValue.substring(with: r) as String
	}

#if os(macOS)
	/// Uses arrow keys to position insertion point within a text view
	func navigateTextView(to line: Int, column: Int) throws {
		for _ in 0..<line {
			typeKey(.downArrow, modifierFlags: [])
		}

		for _ in 0..<column {
			typeKey(.rightArrow, modifierFlags: [])
		}
	}
#endif
}
