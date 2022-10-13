import Foundation
import XCTest

#if os(macOS)
public extension XCUIApplication {
	func saveFrontmostDocument() throws {
		XCTContext.runActivity(named: "Save frontmost document") { (activity) in
			self.typeKey("s", modifierFlags: [.command])
		}
	}

	func closeFrontmostDocument() throws {
		XCTContext.runActivity(named: "Close frontmost document") { (activity) in
			self.typeKey("w", modifierFlags: [.command])
		}
	}

	func createNewDocument() throws {
		XCTContext.runActivity(named: "Create new document") { (activity) in
			self.typeKey("n", modifierFlags: [.command])
		}
	}

	func saveDocument(in window: XCUIElement) throws {
		XCTContext.runActivity(named: "Save document") { (activity) in
			self.typeKey("s", modifierFlags: [.command])
		}
	}

	func saveDocument(in window: XCUIElement, to url: URL, overwrite: Bool = true) throws {
		try XCTContext.runActivity(named: "Save document to URL") { (activity) in
			let path = url.path
			let name = url.lastPathComponent
			let directory = url.deletingLastPathComponent().path

			if overwrite && FileManager.default.fileExists(atPath: path) {
				try FileManager.default.removeItem(atPath: path)
			}

			try saveDocument(in: window)

			let saveSheet = window.sheets["save"]
			let textField = saveSheet.descendants(matching: .textField).element(boundBy: 0)

			textField.typeText("/")

			saveSheet.typeText(directory)
			saveSheet.typeKey(.return, modifierFlags: [])

			textField.typeText(name)

			saveSheet.typeKey(.return, modifierFlags: []) // Save
		}
	}

	@discardableResult
	func openDocument(with url: URL) -> XCUIElement {
		XCTContext.runActivity(named: "Open Document") { (_) in
			self.typeKey("o", modifierFlags: [.command])

			let path = url.path
			let dialog = dialogs["Open"]
			let inputElement = dialog.outlines["sidebar"].children(matching: .outlineRow).element(boundBy: 0).cells.containing(.staticText, identifier: "xSidebarHeader").element

			inputElement.typeText("/")
			inputElement.typeText(path)

			dialog.typeKey(.return, modifierFlags: [])
			dialog.typeKey(.return, modifierFlags: [])
		}

		return windows[url.lastPathComponent]
	}
}
#endif
