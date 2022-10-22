import Foundation
import XCTest

extension XCUIElement {
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
