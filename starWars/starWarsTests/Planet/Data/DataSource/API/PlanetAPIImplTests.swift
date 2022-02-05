//
//  PlanetAPIImplTests.swift
//  starWarsTests
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import XCTest
@testable import starWars

class PlanetAPIImplTests: XCTestCase {

    func testSearch() throws {
        let expectation = self.expectation(description: "Search")
        PlanetAPIImpl().search(
            completion: { result in
                XCTAssertGreaterThan(result.count, 0)
                XCTAssertEqual(result.previous, String.Empty)
                XCTAssertEqual(result.next, "https://swapi.dev/api/planets/?page=2")
                XCTAssertEqual(result.results.count, 10)
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
        PlanetAPIImpl().search(
            value: "ar",
            completion: { result in
                XCTAssertEqual(result.count, 5)
                XCTAssertEqual(result.previous, String.Empty)
                XCTAssertEqual(result.next, String.Empty)
                XCTAssertEqual(result.results.count, 5)
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
        PlanetAPIImpl().page(
            url: "https://swapi.dev/api/planets/?page=3",
            completion: { result in
                XCTAssertGreaterThan(result.count, 0)
                XCTAssertEqual(result.previous, "https://swapi.dev/api/planets/?page=2")
                XCTAssertEqual(result.next, "https://swapi.dev/api/planets/?page=4")
                XCTAssertEqual(result.results.count, 10)
                expectation.fulfill()
            },
            failure: { _ in
                XCTFail()
                expectation.fulfill()
            })
        waitForExpectations(timeout: 10, handler: nil)
    }

}
