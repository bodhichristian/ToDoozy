//
//  MainWindowTests.swift
//  ToDoozyUITests
//
//  Created by Christian Lavelle on 6/25/24.
//

import Foundation
import XCTest

class MainWindowScreen: Screen {
    // Conform to Screen protocol
    var app: XCUIApplication
    
    // Screen-specific elements
    let newListButton: XCUIElement

    
    init(app: XCUIApplication) {
        self.app = app
        
        newListButton = app.buttons["New List"]

    }
    
    
// TODO: you started writign this test in the wrong file
//    func testNewListButtonCreatesList() {
//        let newListCount = app.elementCount(for: "New List")
//        
//        newListButton.click()
//        let postAddCount = app.elementCount(for: "New List")
//        XCTAssert(postAddCount > newListCount)
//    }
}
