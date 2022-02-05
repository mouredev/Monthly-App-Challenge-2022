//
//  PagePlanetUseCaseTests.swift
//  starWarsTests
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import XCTest
@testable import starWars

class PagePlanetUseCaseTests: XCTestCase {

    func testExecute() throws {
        let expectation = self.expectation(description: "Search")
        let useCase = PagePlanetUseCase(repository: PlanetRepositoryImpl(dataSource: PlanetAPIImpl()))
        useCase.execute(url: "https://swapi.dev/api/planets/?page=3") {
            switch $0 {
            case .success(let result):
                XCTAssertGreaterThan(result.count, 0)
                XCTAssertEqual(result.previous, "https://swapi.dev/api/planets/?page=2")
                XCTAssertEqual(result.next, "https://swapi.dev/api/planets/?page=4")
                XCTAssertEqual(result.results.count, 10)
                expectation.fulfill()
            case .failure(_):
                XCTFail()
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }

}
