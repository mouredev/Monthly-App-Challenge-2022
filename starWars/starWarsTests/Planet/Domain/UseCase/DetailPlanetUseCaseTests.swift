//
//  DetailPlanetUseCaseTests.swift
//  starWarsTests
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import XCTest
@testable import starWars

class DetailPlanetUseCaseTests: XCTestCase {

    func testExecute() throws {
        let expectation = self.expectation(description: "Search")
        let useCase = DetailPlanetUseCase(repository: PlanetRepositoryImpl(dataSource: PlanetAPIImpl()))
        useCase.execute(url: "https://swapi.dev/api/planets/3/") {
            switch $0 {
            case .success(let result):
                XCTAssertEqual(result.name, "Yavin IV")
                XCTAssertEqual(result.rotationPeriod, "24")
                XCTAssertEqual(result.orbitalPeriod, "4818")
                XCTAssertEqual(result.diameter, "10200")
                XCTAssertEqual(result.climate, "temperate, tropical")
                XCTAssertEqual(result.gravity, "1 standard")
                XCTAssertEqual(result.terrain, "jungle, rainforests")
                XCTAssertEqual(result.surfaceWater, "8")
                XCTAssertEqual(result.population, "1000")
                XCTAssertEqual(result.residents.count, 0)
                XCTAssertEqual(result.films.count, 1)
                XCTAssertEqual(result.url, "https://swapi.dev/api/planets/3/")
                expectation.fulfill()
            case .failure(_):
                XCTFail()
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }

}
