//
//  PlanetViewModelTests.swift
//  PlanetsInfoTests
//
//  Created by Venkatesh Vipparthi on 19/04/2023.
//

import XCTest
@testable import PlanetsInfo

final class PlanetViewModelTests: XCTestCase {

    var mockingPlanetRepository: MockingPlanetRepository!
    var planetViewModel: PlanetsViewModel!

    @MainActor override func setUpWithError() throws {
        mockingPlanetRepository = MockingPlanetRepository()
        planetViewModel =  PlanetsViewModel(planetsRepository: mockingPlanetRepository)
    }

    override func tearDownWithError() throws {
        mockingPlanetRepository = nil
        planetViewModel =  nil

    }

    func testgetDataForPlanetsList_WhenListISNotEmpty() async throws {
        // Given
        mockingPlanetRepository.setDummyResponse(planets: [Planet.someMockPlanet()])
    
        // When
        await planetViewModel.getDataForPlanetsList(for: "someURL")
        
        // Then
        let planets = await planetViewModel.planets
        XCTAssertEqual(planets.count, 1)
        XCTAssertEqual(planets.first?.name, "Tatooine")

        let error = await planetViewModel.error
        XCTAssertNil(error)

    }
    //when planet list is empty
    func testgetDataForPlanetsList_WhenListIS_Empty() async throws {
        // Given
        mockingPlanetRepository.setDummyResponse(planets: [])
    
        // When
        await planetViewModel.getDataForPlanetsList(for: "someURL")
        
        // Then
        let planets = await planetViewModel.planets
        XCTAssertEqual(planets.count, 0)

        let error = await planetViewModel.error
        XCTAssertNil(error)

    }
    //when repository throws error for getPlanets
    func testgetDataForPlanetsList_Whenthrows_error() async throws {
        // Given
        mockingPlanetRepository.setDummyError(error: NetworkAPIError.parsingError)
    
        // When
        await planetViewModel.getDataForPlanetsList(for: "someURL")
        
        // Then
        let planets = await planetViewModel.planets
        XCTAssertEqual(planets.count, 0)

        let error = await planetViewModel.error
        XCTAssertNotNil(error)

    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
