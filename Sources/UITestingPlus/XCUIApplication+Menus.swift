import Foundation
import XCTest

#if os(macOS)
public extension XCUIApplication {
	var windowMenuItemTitles: [String] {
		return XCTContext.runActivity(named: "Find Window Menu Items") { (_) in
			let windowsItem = menuBars.menuBarItems["Window"]

			// must be shown first to populate the contents
			windowsItem.click()
			windowsItem.click()

			return windowsItem.menuItems.allElementsBoundByIndex.map({ $0.title })
		}
	}

	var windowMenuItemWindowTitles: [String] {
		let systemSuppliedTitles = Set(["Bring All to Front",
										"Arrange in Front",
										"Minimize",
										"Zoom",
										"Zoom All",
										"Tile Window to Left of Screen",
										"Move Window to Left Side of Screen",
										"Tile Window to Right of Screen",
										"Move Window to Right Side of Screen",
										"Minimize All",
										""])

		let titles = windowMenuItemTitles.reversed()

		guard let idx = titles.firstIndex(where: { systemSuppliedTitles.contains($0) }) else {
			return titles.reversed()
		}

		return titles[titles.startIndex..<idx].reversed()
	}

	var recentMenuItemTitles: [String] {
		return XCTContext.runActivity(named: "Find Recent Menu Items") { (_) in
			let items = menuBars.menuBarItems["File"].menuItems["Open Recent"].menuItems

			let recentEntries = items.allElementsBoundByIndex.map { $0.title }

			print("recentEntries: \(recentEntries)")
			if recentEntries.last == "Clear Menu" {
				return recentEntries.dropLast(2)
			}

			return recentEntries
		}
	}
}
#endif
