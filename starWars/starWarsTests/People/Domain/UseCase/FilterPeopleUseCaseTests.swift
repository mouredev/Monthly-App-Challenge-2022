//
//  FilterPeopleUseCaseTests.swift
//  starWarsTests
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import XCTest
@testable import starWars

class FilterPeopleUseCaseTests: XCTestCase {

    func testExecute() throws {
        let expectation = self.expectation(description: "Search")
        let useCase = FilterPeopleUseCase(repository: PeopleRepositoryImpl(dataSource: PeopleAPIImpl()))
        useCase.execute(value: "luke") {
            switch $0 {
            case .success(let result):
                XCTAssertEqual(result.count, 1)
                XCTAssertEqual(result.previous, String.Empty)
                XCTAssertEqual(result.next, String.Empty)
                XCTAssertEqual(result.results.count, 1)
                expectation.fulfill()
            case .failure(_):
                XCTFail()
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

}
