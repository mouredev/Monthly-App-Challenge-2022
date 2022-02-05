//
//  DetailFilmUseCaseTests.swift
//  starWarsTests
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import XCTest
@testable import starWars

class DetailFilmUseCaseTests: XCTestCase {

    func testExecute() throws {
        let expectation = self.expectation(description: "Search")
        let useCase = DetailFilmUseCase(repository: FilmRepositoryImpl(dataSource: FilmAPIImpl()))
        useCase.execute(url: "https://swapi.dev/api/films/2/") {
            switch $0 {
            case .success(let result):
                XCTAssertEqual(result.title, "The Empire Strikes Back")
                XCTAssertEqual(result.episodeId, 5)
                XCTAssertEqual(result.openingCrawl, "It is a dark time for the\r\nRebellion. Although the Death\r\nStar has been destroyed,\r\nImperial troops have driven the\r\nRebel forces from their hidden\r\nbase and pursued them across\r\nthe galaxy.\r\n\r\nEvading the dreaded Imperial\r\nStarfleet, a group of freedom\r\nfighters led by Luke Skywalker\r\nhas established a new secret\r\nbase on the remote ice world\r\nof Hoth.\r\n\r\nThe evil lord Darth Vader,\r\nobsessed with finding young\r\nSkywalker, has dispatched\r\nthousands of remote probes into\r\nthe far reaches of space....")
                XCTAssertEqual(result.director, "Irvin Kershner")
                XCTAssertEqual(result.producer, "Gary Kurtz, Rick McCallum")
                XCTAssertEqual(result.releaseDate, "1980-05-17")
                XCTAssertEqual(result.characters.count, 16)
                XCTAssertEqual(result.planets.count, 4)
                XCTAssertEqual(result.starships.count, 9)
                XCTAssertEqual(result.vehicles.count, 6)
                XCTAssertEqual(result.species.count, 5)
                XCTAssertEqual(result.url, "https://swapi.dev/api/films/2/")
                expectation.fulfill()
            case .failure(_):
                XCTFail()
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }

}
