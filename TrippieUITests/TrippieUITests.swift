//
//  TrippieUITests.swift
//  TrippieUITests
//
//  Created by Gabriel do Prado Moreira on 17/05/22.
//

import XCTest
@testable import Trippie

class TrippieUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testExample() throws {
        
        app.tables.children(matching: .cell).element(boundBy: 0).staticTexts["Belo Horizonte"].tap()
        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 2).tap()
        app.navigationBars["Trip"].buttons["Johnny's Trips"].tap()

    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
