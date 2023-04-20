//
//  PlanetsRepositoryImplemantationTests.swift
//  PlanetsInfoTests
//
//  Created by Admin on 19/04/2023.
//

import XCTest
@testable import PlanetsInfo

class PlanetsRepositoryImplemantationTests: XCTestCase {
    var mockNetworkAPIManager: MockNetworkAPIManagerTests!
    
    @MainActor override func setUp() {
        mockNetworkAPIManager = MockNetworkAPIManagerTests()
    }
    
    override func tearDown() {
        mockNetworkAPIManager = nil
    }

    // when apiManager return success data
    func testWhengetPlanetsListSuccess() async {
        
        let planetsRepositoryImplemantation = PlanetsRepositoryImplemantation(networkAPIManager: MockNetworkAPIManagerTests() as! Networkable)
      //  mockNetworkAPIManager. = "PlanetsListResponseData"
//        let lists = try! await planetsRepository.getAllPlanets()
//        XCTAssertNotNil(lists)
//        XCTAssertEqual(lists.count, 10)
    }

}
