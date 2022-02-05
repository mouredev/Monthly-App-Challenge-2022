//
//  FilterStarshipUseCaseTests.swift
//  starWarsTests
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import XCTest
@testable import starWars

class FilterStarshipUseCaseTests: XCTestCase {

    func testExecute() throws {
        let expectation = self.expectation(description: "Search")
        let useCase = FilterStarshipUseCase(repository: StarshipRepositoryImpl(dataSource: StarshipAPIImpl()))
        useCase.execute(value: "on") {
            switch $0 {
            case .success(let result):
                XCTAssertEqual(result.count, 8)
                XCTAssertEqual(result.previous, String.Empty)
                XCTAssertEqual(result.next, String.Empty)
                XCTAssertEqual(result.results.count, 8)
                expectation.fulfill()
            case .failure(_):
                XCTFail()
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }

}
