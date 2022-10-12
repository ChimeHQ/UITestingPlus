import Foundation
import XCTest

public extension XCUIApplication {
	func launchWithNoWindows() {
		launchArguments.append(contentsOf: ["-ApplePersistenceIgnoreState", "YES"])
		launch()
		#if os(macOS)
		if closeExistingWindows() {
			// this is a perf optimization. If we quit with the windows closed,
			// they should remain closed for future launches. Otherwise state
			// restoration could keep bringing them back.
			quit()
			launch()
		}
		#endif
	}

	#if os(macOS)
	func closeExistingWindows() -> Bool {
		if dialogs.count > 0 {
			return false
		}

		return XCTContext.runActivity(named: "Close Existing Windows") { (activity) in
			var closedAny = false

			// attempt to close any windows, a maximum of ten times
			for _ in 0..<10 {
				let closeButtons = windows.buttons.matching(identifier: XCUIIdentifierCloseWindow)

				if closeButtons.count == 0 {
					return closedAny
				}

				let button = closeButtons.element(boundBy: 0)

				button.click()
				closedAny = true
			}

			return closedAny
		}
	}
	#endif

	var frontWindow: XCUIElement {
		return windows.element
	}

	func resetLaunchEnvironmentAndArguments() {
		launchEnvironment = [:]
		launchArguments = []
	}

	#if os(macOS)
	func quit() {
		XCTContext.runActivity(named: "Quit") { (activity) in
			self.typeKey("q", modifierFlags: [.command])
			XCTAssertTrue(wait(for: .notRunning, timeout: 2.0))
		}
	}
	#endif
}
