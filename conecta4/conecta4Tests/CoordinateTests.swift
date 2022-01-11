//
//  CoordinateTests.swift
//  moureJanuaryTests
//
//  Created by Diego Alberto Dominguez Herreros on 8/1/22.
//

import XCTest
@testable import conecta4

class CoordinateTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSelected() throws {
        let coordinate = Coordinate(x: 0, y: 0)
        XCTAssertEqual(NullPlayer().color, coordinate.getColor())
        XCTAssertEqual(false, coordinate.active)
        coordinate.selected(LocalPlayer())
        XCTAssertEqual(LocalPlayer().color, coordinate.getColor())
        XCTAssertEqual(true, coordinate.active)
    }

    func testClear() throws {
        let coordinate = Coordinate(x: 0, y: 0)
        XCTAssertEqual(NullPlayer().color, coordinate.getColor())
        XCTAssertEqual(false, coordinate.active)
        coordinate.selected(AwayPlayer())
        XCTAssertEqual(AwayPlayer().color, coordinate.getColor())
        XCTAssertEqual(true, coordinate.active)
        coordinate.clear()
        XCTAssertEqual(NullPlayer().color, coordinate.getColor())
        XCTAssertEqual(false, coordinate.active)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
