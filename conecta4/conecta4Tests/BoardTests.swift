//
//  BoardTests.swift
//  moureJanuaryTests
//
//  Created by Diego Alberto Dominguez Herreros on 8/1/22.
//

import XCTest
@testable import conecta4
import SwiftUI

class BoardTests: XCTestCase {
    
    var board: Board?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    override func setUp() {
        self.board = Board(height: 6, width: 7)
    }
    
    func testGet() throws {
        let coordinate = self.board?.get(5, 6)
        XCTAssertEqual(NullPlayer().color, coordinate?.getColor())
        XCTAssertEqual(false, coordinate?.active)
        coordinate?.selected(LocalPlayer())
        XCTAssertEqual(LocalPlayer().color, coordinate?.getColor())
        XCTAssertEqual(true, coordinate?.active)
    }

    func testGetOnlyColumn() throws {
        var coordinate = self.board?.get(5)
        XCTAssertEqual(false, coordinate?.active)
        XCTAssertEqual(5, coordinate?.x)
        fill(y: 5, player: AwayPlayer())
        fill(y: 5, player: AwayPlayer())
        coordinate = self.board?.get(5)
        XCTAssertEqual(3, coordinate?.x)
        XCTAssertEqual(false, coordinate?.active)
        coordinate = self.board?.get(5)
        XCTAssertEqual(3, coordinate?.x)
        XCTAssertEqual(false, coordinate?.active)
        fill(y: 5, player: LocalPlayer())
        fill(y: 5, player: LocalPlayer())
        fill(y: 5, player: LocalPlayer())
        fill(y: 5, player: LocalPlayer())
        coordinate = self.board?.get(5)
        XCTAssertNil(coordinate)
    }
    
    func testGetAllCoordinatesByColumn() throws {
        var coordinates = self.board?.getAll(5)
        XCTAssertEqual(6, coordinates?.count)
        fill(y: 5, player: AwayPlayer())
        coordinates = self.board?.getAll(5)
        XCTAssertEqual(5, coordinates?.count)
        fill(y: 5, player: AwayPlayer())
        fill(y: 5, player: AwayPlayer())
        coordinates = self.board?.getAll(5)
        XCTAssertEqual(3, coordinates?.count)
    }
    
    func testBoardEmpty() throws {
        XCTAssertEqual(true, self.board?.boardEmpty());
        let coordinate = self.board?.get(0)
        XCTAssertEqual(false, coordinate?.active)
        coordinate?.selected(AwayPlayer())
        XCTAssertEqual(false, self.board?.boardEmpty());
    }
    
    func testClear() throws {
        XCTAssertEqual(true, self.board?.boardEmpty());
        let coordinate = self.board?.get(0)
        XCTAssertEqual(false, coordinate?.active)
        coordinate?.selected(AwayPlayer())
        XCTAssertEqual(false, self.board?.boardEmpty());
        self.board?.clear()
        XCTAssertEqual(true, self.board?.boardEmpty());
    }
    
    func testWinLeft() throws {
        let player = AwayPlayer()
        XCTAssertEqual(false, self.board?.isWin(player));
        fill(y: 5, player: player)
        fill(y: 3, player: player)
        XCTAssertEqual(false, self.board?.isWin(player));
        fill(y: 4, player: player)
        fill(y: 1, player: player)
        XCTAssertEqual(false, self.board?.isWin(player));
        fill(y: 2, player: player)
        XCTAssertEqual(true, self.board?.isWin(player));
    }
    
    func testWinDown() throws {
        let player = AwayPlayer()
        XCTAssertEqual(false, self.board?.isWin(player));
        fill(y: 2, player: player)
        fill(y: 2, player: player)
        XCTAssertEqual(false, self.board?.isWin(player));
        fill(y: 2, player: player)
        fill(y: 1, player: player)
        XCTAssertEqual(false, self.board?.isWin(player));
        fill(y: 2, player: player)
        XCTAssertEqual(true, self.board?.isWin(player));
    }
    
    func testWinDiagonalUp() throws {
        let local = LocalPlayer()
        let away = AwayPlayer()
        XCTAssertEqual(false, self.board?.isWin(local));
        fill(y: 1, player: local)
        fill(y: 2, player: away)
        fill(y: 2, player: local)
        XCTAssertEqual(false, self.board?.isWin(local));
        fill(y: 4, player: away)
        fill(y: 4, player: local)
        fill(y: 4, player: away)
        fill(y: 4, player: local)
        XCTAssertEqual(false, self.board?.isWin(local));
        fill(y: 3, player: away)
        fill(y: 3, player: local)
        fill(y: 2, player: away)
        fill(y: 3, player: local)
        XCTAssertEqual(true, self.board?.isWin(local));
    }
    
    func testWinDiagonalDown() throws {
        let local = LocalPlayer()
        let away = AwayPlayer()
        XCTAssertEqual(false, self.board?.isWin(local));
        fill(y: 5, player: local)
        fill(y: 4, player: away)
        fill(y: 4, player: local)
        XCTAssertEqual(false, self.board?.isWin(local));
        fill(y: 2, player: away)
        fill(y: 2, player: local)
        fill(y: 2, player: away)
        fill(y: 2, player: local)
        XCTAssertEqual(false, self.board?.isWin(local));
        fill(y: 3, player: away)
        fill(y: 3, player: local)
        fill(y: 2, player: away)
        fill(y: 3, player: local)
        XCTAssertEqual(true, self.board?.isWin(local));
    }
    
    private func fill(y: Int, player: Player) {
        let coordinate = self.board?.get(y)
        coordinate?.selected(player)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
