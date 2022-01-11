//
//  PlayerTest.swift
//  moureJanuaryTests
//
//  Created by Diego Alberto Dominguez Herreros on 8/1/22.
//

import XCTest
@testable import conecta4
import SwiftUI

class PlayerTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNullPlayerColor() throws {
        let player = NullPlayer()
        XCTAssertEqual(Color.white, player.color)
    }

    func testLocalPlayerColor() throws {
        let player = LocalPlayer()
        XCTAssertEqual(Color.red, player.color)
    }
    
    func testAwayPlayerColor() throws {
        let player = AwayPlayer()
        XCTAssertEqual(Color.yellow, player.color)
    }
    
    func testWin() throws {
        let player = LocalPlayer()
        XCTAssertEqual(0, player.wins)
        player.win()
        XCTAssertEqual(1, player.wins)
        player.win()
        XCTAssertEqual(2, player.wins)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
