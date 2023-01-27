import Foundation
import XCTest

public extension XCUIElement {
    
    /// Returns true if the element exists within 3 seconds
    var existsSoon: Bool {
        return waitForExistence(timeout: XCTestSoon.defaultWaitTime)
    }

    /// Returns true if the element does not exist within 3 seconds
    var doesNotExistSoon: Bool {
        return waitForNonExistence(timeout: XCTestSoon.defaultWaitTime)
    }
    
    /// Returns true if the element's `isHittable` property is true within 3 seconds
    var isHittableSoon: Bool {
        return waitForHittable(timeout: XCTestSoon.defaultWaitTime)
    }

    /// Returns true if the element's `isHittable` property is false within 3 seconds
    var isNotHittableSoon: Bool {
        return waitForNotHittable(timeout: XCTestSoon.defaultWaitTime)
    }
    
    /// Waits for the element to exist for `waitTime` (default 3 seconds), then taps the element. If it does not exist within `waitTime` seconds, causes a test assertion failure.
    func tapSoon(file: StaticString = #filePath, line: UInt = #line, waitTime: TimeInterval = XCTestSoon.defaultWaitTime) {
        XCTAssert(self.waitForExistence(timeout: waitTime), file: file, line: line)
        self.tap()
    }
}
