//
//  ToDoozyUITests.swift
//  ToDoozyUITests
//
//  Created by christian on 6/17/24.
//

import XCTest

final class ToDoozyUITests: XCTestCase {

    var app: XCUIApplication!
    var screen: Screen!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = true

        app = XCUIApplication()
        app.launch()
        
    }

    override func tearDownWithError() throws {
        app = nil
        super.tearDown()
    }

    
    func testQuery() {
        
    }
}
