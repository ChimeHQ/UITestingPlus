import Foundation
import XCTest

public extension XCUIElement {
    
    /// Returns true if the element's `isHittable` property is true within `timeout` seconds
    func waitForHittable(timeout: TimeInterval) -> Bool {
        let predicate = NSPredicate(format: "isHittable == 1")
        let exp = XCTNSPredicateExpectation(predicate: predicate, object: self)
        
        let result = XCTWaiter.wait(for: [exp], timeout: timeout)
        
        return result == .completed
    }
    
    /// Returns true if the element's `isHittable` property is false within `timeout` seconds
    func waitForNotHittable(timeout: TimeInterval) -> Bool {
        let predicate = NSPredicate(format: "isHittable == 0")
        let exp = XCTNSPredicateExpectation(predicate: predicate, object: self)
        
        let result = XCTWaiter.wait(for: [exp], timeout: timeout)
        
        return result == .completed
    }
    
    
}
