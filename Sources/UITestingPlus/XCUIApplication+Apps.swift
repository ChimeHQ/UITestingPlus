import Foundation
import XCTest

#if os(iOS)

public extension XCUIApplication {
    static let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
    static let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
    static let settings = XCUIApplication(bundleIdentifier: "com.apple.Preferences")
    static let files = XCUIApplication(bundleIdentifier: "com.apple.DocumentsApp")
    static let photos = XCUIApplication(bundleIdentifier: "com.apple.mobileslideshow")
}

#endif
