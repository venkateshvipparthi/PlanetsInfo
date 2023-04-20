//
//  MockingPlanetRepository.swift
//  PlanetsInfoTests
//
//  Created by Venkatesh Vipparthi on 19/04/2023.
//

import Foundation

@testable import PlanetsInfo

class MockingPlanetRepository: PlanetsRepository {
    private var planets: [Planet] = []
    private var error: NetworkAPIError?

    func getPlanetsList(for url: URL) async throws -> [PlanetsInfo.Planet] {
        if error != nil {
            throw error!
        }
        return planets

    }
    

    func setDummyResponse(planets: [Planet]) {
        self.planets = planets
    }
    func setDummyError(error: NetworkAPIError) {
        self.error = error
    }
}
