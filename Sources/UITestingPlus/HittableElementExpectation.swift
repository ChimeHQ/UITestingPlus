import Foundation
import XCTest

/// Expectation subclass for waiting on an XCUIElement to be hittable.
public class HittableElementExpectation: XCTNSPredicateExpectation {
	private static let hittablePredicate = NSPredicate(format: "exists == 1 && isHittable == 1")

	public init(element: XCUIElement) {
		let p = HittableElementExpectation.hittablePredicate

		super.init(predicate: p, object: element)
	}

	public var element: XCUIElement {
		return object as! XCUIElement
	}
}
