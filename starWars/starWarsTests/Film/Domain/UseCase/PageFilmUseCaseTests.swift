//
//  PageFilmUseCaseTests.swift
//  starWarsTests
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import XCTest
@testable import starWars

class PageFilmUseCaseTests: XCTestCase {

    func testExecute() throws {
        let expectation = self.expectation(description: "Search")
        let useCase = PageFilmUseCase(repository: FilmRepositoryImpl(dataSource: FilmAPIImpl()))
        useCase.execute(url: "https://swapi.dev/api/films/?page=2") {
            switch $0 {
            case .success(_):
                XCTFail()
                expectation.fulfill()
            case .failure(_):
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }

}
