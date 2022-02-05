//
//  PageVehicleUseCaseTests.swift
//  starWarsTests
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import XCTest
@testable import starWars

class PageVehicleUseCaseTests: XCTestCase {

    func testExecute() throws {
        let expectation = self.expectation(description: "Search")
        let useCase = PageVehicleUseCase(repository: VehicleRepositoryImpl(dataSource: VehicleAPIImpl()))
        useCase.execute(url: "https://swapi.dev/api/vehicles/?page=2") {
            switch $0 {
            case .success(let result):
                XCTAssertGreaterThan(result.count, 0)
                XCTAssertEqual(result.previous, "https://swapi.dev/api/vehicles/?page=1")
                XCTAssertEqual(result.next, "https://swapi.dev/api/vehicles/?page=3")
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
