//
//  FilterPlanetUseCaseTests.swift
//  starWarsTests
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import XCTest
@testable import starWars

class FilterPlanetUseCaseTests: XCTestCase {

    func testExecute() throws {
        let expectation = self.expectation(description: "Search")
        let useCase = FilterPlanetUseCase(repository: PlanetRepositoryImpl(dataSource: PlanetAPIImpl()))
        useCase.execute(value: "ar") {
            switch $0 {
            case .success(let result):
                XCTAssertEqual(result.count, 5)
                XCTAssertEqual(result.previous, String.Empty)
                XCTAssertEqual(result.next, String.Empty)
                XCTAssertEqual(result.results.count, 5)
                expectation.fulfill()
            case .failure(_):
                XCTFail()
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

}
