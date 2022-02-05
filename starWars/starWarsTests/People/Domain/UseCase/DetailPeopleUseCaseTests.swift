//
//  DetailPeopleUseCaseTests.swift
//  starWarsTests
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import XCTest
@testable import starWars

class DetailPeopleUseCaseTests: XCTestCase {

    func testExecute() throws {
        let expectation = self.expectation(description: "Search")
        let useCase = DetailPeopleUseCase(repository: PeopleRepositoryImpl(dataSource: PeopleAPIImpl()))
        useCase.execute(url: "https://swapi.dev/api/people/1/") {
            switch $0 {
            case .success(let result):
                XCTAssertEqual(result.name, "Luke Skywalker")
                XCTAssertEqual(result.height, "172")
                XCTAssertEqual(result.mass, "77")
                XCTAssertEqual(result.hairColor, "blond")
                XCTAssertEqual(result.skinColor, "fair")
                XCTAssertEqual(result.eyeColor, "blue")
                XCTAssertEqual(result.birthYear, "19BBY")
                XCTAssertEqual(result.gender, "male")
                XCTAssertEqual(result.homeworld, "https://swapi.dev/api/planets/1/")
                XCTAssertEqual(result.films.count, 4)
                XCTAssertEqual(result.species.count, 0)
                XCTAssertEqual(result.vehicles.count, 2)
                XCTAssertEqual(result.starships.count, 2)
                XCTAssertEqual(result.url, "https://swapi.dev/api/people/1/")
                expectation.fulfill()
            case .failure(_):
                XCTFail()
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }

}
