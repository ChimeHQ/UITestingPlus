import XCTest

public extension XCUIElement {
	var outlineDisclosureTriangle: XCUIElement {
		return disclosureTriangles["NSOutlineViewDisclosureButtonKey"]
	}
}

public extension XCUIElement {
	var closeWindowButton: XCUIElement {
		return buttons.matching(identifier: XCUIIdentifierCloseWindow).firstMatch
	}
}

public extension XCUIElementQuery {
	subscript(index: Int) -> XCUIElement {
		return element(boundBy: index)
	}
}

public extension XCUIElement {
	var hasKeyboardFocus: Bool {
		return (value(forKey: "hasKeyboardFocus") as? Bool) ?? false
	}
}
