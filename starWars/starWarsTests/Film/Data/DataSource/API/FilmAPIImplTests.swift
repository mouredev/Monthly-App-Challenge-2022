//
//  FilmAPIImplTests.swift
//  starWarsTests
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import XCTest
@testable import starWars

class FilmAPIImplTests: XCTestCase {

    func testSearch() throws {
        let expectation = self.expectation(description: "Search")
        FilmAPIImpl().search(
            completion: { result in
                XCTAssertGreaterThan(result.count, 0)
                XCTAssertEqual(result.previous, String.Empty)
                XCTAssertEqual(result.next, String.Empty)
                XCTAssertEqual(result.results.count, 6)
                expectation.fulfill()
            },
            failure: { _ in
                XCTFail()
                expectation.fulfill()
            })
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testSearchWithFilter() throws {
        let expectation = self.expectation(description: "Search")
        FilmAPIImpl().search(
            value: "on",
            completion: { result in
                XCTAssertEqual(result.count, 1)
                XCTAssertEqual(result.previous, String.Empty)
                XCTAssertEqual(result.next, String.Empty)
                XCTAssertEqual(result.results.count, 1)
                expectation.fulfill()
            },
            failure: { _ in
                XCTFail()
                expectation.fulfill()
            })
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testPage() throws {
        let expectation = self.expectation(description: "Search")
        FilmAPIImpl().page(
            url: "https://swapi.dev/api/films/?page=2",
            completion: { result in
                XCTFail()
            },
            failure: { _ in
                expectation.fulfill()
            })
        waitForExpectations(timeout: 10, handler: nil)
    }

}
