//
//  DetailSpeccyUseCaseTests.swift
//  starWarsTests
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import XCTest
@testable import starWars

class DetailSpeccyUseCaseTests: XCTestCase {

    func testExecute() throws {
        let expectation = self.expectation(description: "Search")
        let useCase = DetailSpeccyUseCase(repository: SpeccyRepositoryImpl(dataSource: SpeccyAPIImpl()))
        useCase.execute(url: "https://swapi.dev/api/species/8/") {
            switch $0 {
            case .success(let result):
                XCTAssertEqual(result.name, "Mon Calamari")
                XCTAssertEqual(result.classification, "amphibian")
                XCTAssertEqual(result.designation, "sentient")
                XCTAssertEqual(result.averageHeight, "160")
                XCTAssertEqual(result.skinColors, "red, blue, brown, magenta")
                XCTAssertEqual(result.hairColors, "none")
                XCTAssertEqual(result.eyeColors, "yellow")
                XCTAssertEqual(result.averageLifespan, "unknown")
                XCTAssertEqual(result.homeworld, "https://swapi.dev/api/planets/31/")
                XCTAssertEqual(result.language, "Mon Calamarian")
                XCTAssertEqual(result.people.count, 1)
                XCTAssertEqual(result.films.count, 1)
                XCTAssertEqual(result.url, "https://swapi.dev/api/species/8/")
                expectation.fulfill()
            case .failure(_):
                XCTFail()
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }

}
