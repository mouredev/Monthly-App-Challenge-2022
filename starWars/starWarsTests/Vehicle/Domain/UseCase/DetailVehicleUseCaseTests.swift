//
//  DetailVehicleUseCaseTests.swift
//  starWarsTests
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import XCTest
@testable import starWars

class DetailVehicleUseCaseTests: XCTestCase {

    func testExecute() throws {
        let expectation = self.expectation(description: "Search")
        let useCase = DetailVehicleUseCase(repository: VehicleRepositoryImpl(dataSource: VehicleAPIImpl()))
        useCase.execute(url: "https://swapi.dev/api/vehicles/14/") {
            switch $0 {
            case .success(let result):
                XCTAssertEqual(result.name, "Snowspeeder")
                XCTAssertEqual(result.model, "t-47 airspeeder")
                XCTAssertEqual(result.manufacturer, "Incom corporation")
                XCTAssertEqual(result.costInCredits, "unknown")
                XCTAssertEqual(result.length, "4.5")
                XCTAssertEqual(result.maxAtmospheringSpeed, "650")
                XCTAssertEqual(result.crew, "2")
                XCTAssertEqual(result.passengers, "0")
                XCTAssertEqual(result.cargoCapacity, "10")
                XCTAssertEqual(result.consumables, "none")
                XCTAssertEqual(result.vehicleClass, "airspeeder")
                XCTAssertEqual(result.pilots.count, 2)
                XCTAssertEqual(result.films.count, 1)
                XCTAssertEqual(result.url, "https://swapi.dev/api/vehicles/14/")
                expectation.fulfill()
            case .failure(_):
                XCTFail()
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }

}
