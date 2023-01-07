import XCTest

public extension XCUIElement {
	/// Waits until an element no longer exists.
	///
	/// Useful for coordinating UI state changes that take time.
	func waitForNonExistence(timeout: TimeInterval) -> Bool {
		let predicate = NSPredicate(format: "exists == 0")
		let exp = XCTNSPredicateExpectation(predicate: predicate, object: self)

		let result = XCTWaiter.wait(for: [exp], timeout: timeout)

		return result == .completed
	}
}
