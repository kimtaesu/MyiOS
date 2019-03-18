//
//  UnitTestPracticalUITests.swift
//  UnitTestPracticalUITests
//
//  Created by tskim on 18/03/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import XCTest

class UnitTestPracticalUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
    }

    func testClickSampleItem() {
        let tableView = app.tables["access_tableview"]
        let cell = tableView.cells.staticTexts["aaa"]
        cell.taps(1)
        
        let detailTitleView = app.staticTexts["aaa"]
        XCTAssertEqual("aaa", detailTitleView.label)
        
    }
}

extension XCUIElement {
    func taps(_ count: Int) {
        for _ in 0..<count {
            XCTAssertTrue(self.waitForExistence(timeout: 3))
            self.tap()
        }
    }
}
