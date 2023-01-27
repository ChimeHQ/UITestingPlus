import Foundation
import XCTest


/// The default amount of time to wait for functions and variables with "soon" in their name. 3 seconds.
public enum XCTestSoon {
    public static let defaultWaitTime: TimeInterval = 3
}

/// Returns true if `expression` evaluates to true within `waitTime` (default 3 seconds)
public func IsTrueSoon(_ expression: @autoclosure () throws -> Bool, waitTime: TimeInterval = XCTestSoon.defaultWaitTime) -> Bool {
    let startTime = Date()
    repeat {
        let success = (try? expression()) ?? false
        if success {
            return true
        }
        else {
            Thread.sleep(forTimeInterval: 1)
        }
    }
    while Date().timeIntervalSince(startTime) < waitTime
    
    return (try? expression()) ?? false
}

/// Drop-in replacement for `XCTAssert` that gives `waitTime` (default 3 seconds) for `expression` to evaluate to true
public func XCTAssertSoon(_ expression: @autoclosure () throws -> Bool, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line, waitTime: TimeInterval = XCTestSoon.defaultWaitTime) {
    XCTAssert(IsTrueSoon(try expression(), waitTime: waitTime), message(), file: file, line: line)
}

/// Drop-in replacement for XCTUnwrap that gives `waitTime` (default 3 seconds) for `expression` to evaluate to non-nil
public func XCTUnwrapSoon<T>(_ expression: @autoclosure () throws -> T?, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line, waitTime: TimeInterval = XCTestSoon.defaultWaitTime) throws -> T {
    let startTime = Date()
    repeat {
        if let result = try? expression() {
            return result
        }
        else {
            Thread.sleep(forTimeInterval: 1)
        }
    }
    while Date().timeIntervalSince(startTime) < waitTime
    
    return try XCTUnwrap(expression(), message(), file: file, line: line)
}

/// Drop-in replacement for `XCTAssertEqual` that gives `waitTime` (default 3 seconds) for `expression1` to evaluate to equal to `expression2`
public func XCTAssertEqualSoon<T>(_ expression1: @autoclosure () throws -> T, _ expression2: @autoclosure () throws -> T, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line, waitTime: TimeInterval = XCTestSoon.defaultWaitTime) where T : Equatable {
    if try IsTrueSoon(expression1() == expression2(), waitTime: waitTime) {
        return
    }
    
    XCTAssertEqual(try expression1(), try expression2(), message(), file: file, line: line)

}

/// Drop-in replacement for `XCTAssertNotEqual` that gives `waitTime` (default 3 seconds) for `expression1` to evaluate not equal to `expression2`
public func XCTAssertNotEqualSoon<T>(_ expression1: @autoclosure () throws -> T, _ expression2: @autoclosure () throws -> T, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line, waitTime: TimeInterval = XCTestSoon.defaultWaitTime) where T : Equatable {
    if try IsTrueSoon(expression1() != expression2(), waitTime: waitTime) {
        return
    }

    XCTAssertNotEqual(try expression1(), try expression2(), message(), file: file, line: line)
}
