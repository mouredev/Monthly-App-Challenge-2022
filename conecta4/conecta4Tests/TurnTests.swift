//
//  TurnTests.swift
//  moureJanuaryTests
//
//  Created by Diego Alberto Dominguez Herreros on 8/1/22.
//

import XCTest
@testable import conecta4

class TurnTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTurnNext() throws {
        let turn = Turn()
        XCTAssertEqual(true, turn.isTurnLocal())
        turn.next()
        XCTAssertEqual(false, turn.isTurnLocal())
        turn.next()
        XCTAssertEqual(true, turn.isTurnLocal())
    }
    
    func testWin() throws {
        let turn = Turn()
        turn.win()
        XCTAssertEqual(1, turn.localWins())
        XCTAssertEqual(0, turn.awayWins())
        turn.win()
        XCTAssertEqual(2, turn.localWins())
        XCTAssertEqual(0, turn.awayWins())
        turn.next()
        turn.win()
        XCTAssertEqual(2, turn.localWins())
        XCTAssertEqual(1, turn.awayWins())
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
