//
//  ContentViewUITest.swift
//  moureJanuaryUITests
//
//  Created by Diego Alberto Dominguez Herreros on 8/1/22.
//

import XCTest
@testable import conecta4

class ContentViewUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testImage() throws {
        let app = XCUIApplication()
        app.launch()
        XCTAssertTrue(app.images["image"].exists)
    }
    
    func testPlayers() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        XCTAssertTrue(app.staticTexts["localWinsIcon"].exists)
        XCTAssertEqual(": 0", app.staticTexts["localWins"].label)
        XCTAssertTrue(app.staticTexts["awayWinsIcon"].exists)
        XCTAssertEqual(": 0", app.staticTexts["awayWins"].label)
    }
    
    func testButtonNewGameExists() throws {
        let app = XCUIApplication()
        app.launch()
        let button = app.buttons["buttonNewGame"]
        XCTAssertTrue(button.exists)
    }
    
    func testAlertNewGameTap() throws {
        let app = XCUIApplication()
        app.launch()
        let button = app.buttons["buttonNewGame"]
        XCTAssertTrue(button.exists)
        app.buttons["buttonCell_0_0"].tap()
        button.tap()
        
        let alert = app.alerts["Do you want to start a new game?"]
        XCTAssertTrue(alert.exists)
        let buttonContinue = alert.buttons["Ok"]
        XCTAssertTrue(buttonContinue.exists)
        XCTAssertTrue(alert.buttons["Cancel"].exists)
        buttonContinue.tap()
        button.tap()
        XCTAssertTrue(!app.alerts["Do you want to start a new game?"].exists)
    }
    
    func testSingleLineExist() throws {
        let app = XCUIApplication()
        app.launch()
        XCTAssertTrue(app.staticTexts["singleLine"].exists)
    }

    func testCellsExists() throws {
        let app = XCUIApplication()
        app.launch()
        for i in 0..<6 {
            for j in 0..<7 {
                XCTAssertTrue(app.buttons["buttonCell_\(i)_\(j)"].exists)
            }
        }
    }
    
    func testAlertWinShow() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["buttonCell_\(0)_\(0)"].tap()
        sleep(2)
        app.buttons["buttonCell_\(0)_\(1)"].tap()
        sleep(2)
        app.buttons["buttonCell_\(0)_\(0)"].tap()
        sleep(2)
        app.buttons["buttonCell_\(1)_\(1)"].tap()
        sleep(2)
        app.buttons["buttonCell_\(0)_\(0)"].tap()
        sleep(2)
        app.buttons["buttonCell_\(1)_\(1)"].tap()
        sleep(2)
        app.buttons["buttonCell_\(0)_\(0)"].tap()
        let alert = app.alerts["Player Red WIN!!!"]
        XCTAssertTrue(alert.exists)
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
