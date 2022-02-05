//
//  DetailStarshipUseCaseTests.swift
//  starWarsTests
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import XCTest
@testable import starWars

class DetailStarshipUseCaseTests: XCTestCase {

    func testExecute() throws {
        let expectation = self.expectation(description: "Search")
        let useCase = DetailStarshipUseCase(repository: StarshipRepositoryImpl(dataSource: StarshipAPIImpl()))
        useCase.execute(url: "https://swapi.dev/api/starships/9/") {
            switch $0 {
            case .success(let result):
                XCTAssertEqual(result.name, "Death Star")
                XCTAssertEqual(result.model, "DS-1 Orbital Battle Station")
                XCTAssertEqual(result.manufacturer, "Imperial Department of Military Research, Sienar Fleet Systems")
                XCTAssertEqual(result.costInCredits, "1000000000000")
                XCTAssertEqual(result.length, "120000")
                XCTAssertEqual(result.maxAtmospheringSpeed, "n/a")
                XCTAssertEqual(result.crew, "342,953")
                XCTAssertEqual(result.passengers, "843,342")
                XCTAssertEqual(result.cargoCapacity, "1000000000000")
                XCTAssertEqual(result.consumables, "3 years")
                XCTAssertEqual(result.hyperdriveRating, "4.0")
                XCTAssertEqual(result.MGLT, "10")
                XCTAssertEqual(result.starshipClass, "Deep Space Mobile Battlestation")
                XCTAssertEqual(result.pilots.count, 0)
                XCTAssertEqual(result.films.count, 1)
                XCTAssertEqual(result.url, "https://swapi.dev/api/starships/9/")
                expectation.fulfill()
            case .failure(_):
                XCTFail()
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }

}
