//
//  PlanetsRepositoryTests.swift
//  PlanetsInfoTests
//
//  Created by Admin on 19/04/2023.
//

import XCTest
@testable import PlanetsInfo

class PlanetsRepositoryTests: XCTestCase {
    
    var mockRestAPIManager: MockNetworkAPIManagerTests!
    
    @MainActor override func setUp() {
        mockRestAPIManager = MockNetworkAPIManagerTests()
    }
    
    override func tearDown() {
        mockRestAPIManager = nil
    }

    
    // when apiManager return success data
    func testWhengetPlanetsListSuccess() async {
        
        let planetRepository = PlanetsRepositoryImplemantation(networkAPIManager: <#Networkable#>)
//        let planetsRepository = PlanetsRepository(serviceManager: mockRestAPIManager, persisttence: PersistenceController(inMemory: true))
//        mockRestAPIManager.path = "PlanetsListResponseData"
//        let lists = try! await planetsRepository.getAllPlanets()
//        XCTAssertNotNil(lists)
//        XCTAssertEqual(lists.count, 10)
    }

    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
