//
//  XCTest+.swift
//  ToDoozy
//
//  Created by Christian Lavelle on 6/25/24.
//
import Foundation
import XCTest

extension XCUIApplication {
    // MARK: clearTextOnElement(_ element:)
    ///
    /// Clear a text field of any typed text.
    /// - Parameter element: Expects a Text Field element for interaction
    func clearTextOnElement(_ element: XCUIElement) {
        element.doubleTap()
        menuItems["Cut"].tap()
    }
    
    // MARK: elementCount(for label:)
    //
    /// Count the number of elements who's static text matches the provided label
    /// - Parameter label: Provide a string value to match UI elements based on an object's label
    func elementCount(for label: String) -> Int {
            return self.staticTexts.containing(NSPredicate(format: "label CONTAINS[c] %@", label)).count
        }
}
