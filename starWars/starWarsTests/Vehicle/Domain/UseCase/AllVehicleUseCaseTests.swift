//
//  AllVehicleUseCaseTests.swift
//  starWarsTests
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import XCTest
@testable import starWars

class AllVehicleUseCaseTests: XCTestCase {

    func testExecute() throws {
        let expectation = self.expectation(description: "Search")
        let useCase = AllVehicleUseCase(repository: VehicleRepositoryImpl(dataSource: VehicleAPIImpl()))
        useCase.execute {
            switch $0 {
            case .success(let result):
                XCTAssertGreaterThan(result.count, 0)
                XCTAssertEqual(result.previous, String.Empty)
                XCTAssertEqual(result.next, "https://swapi.dev/api/vehicles/?page=2")
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
