//
//  MockNetworkAPIManagerTests.swift
//  PlanetsInfoTests
//
//  Created by Venkatesh Vipparthi on 19/04/2023.
//

import XCTest
@testable import PlanetsInfo

final class MockNetworkAPIManagerTests: XCTestCase {
    
    var mockNetworking: MockNetworking!
    var networkManager: NetworkApiManager!
    
    @MainActor override func setUp() {
        mockNetworking = MockNetworking()
        networkManager = NetworkApiManager(urlSession: mockNetworking)
    }
    
    override func tearDown() {
        mockNetworking = nil
        networkManager = nil
    }
    
    //when API is successful, get function will return expected data,
    func testGetPlanetsList_WhenResponseIs_200() async {
        
        // GIVEN
         let data = "response".data(using: .utf8)
        mockNetworking.mockData = data
        mockNetworking.mockResponse = HTTPURLResponse(url:URL(string: "dummyURL")!, statusCode: 200, httpVersion:nil, headerFields:nil)
        
        // When
        let actualData = try! await networkManager.get(url:  URL(string: "dummyURL")!)
        
        // Then
        XCTAssertEqual(actualData, data)
    }
    
    //when API is fails with status code 404
    func testGetPlanetsList_WhenAPIFailsToReturnExpectedData() async {

        // Given
         let data = "response".data(using: .utf8)
        mockNetworking.mockData = data
        mockNetworking.mockResponse = HTTPURLResponse(url:URL(string: "dummyURL")!, statusCode: 404, httpVersion:nil, headerFields:nil)
        
        do {
            _ = try await networkManager.get(url:  URL(string: "dummyURL")!)
        } catch {
            XCTAssertEqual(error as! NetworkAPIError, NetworkAPIError.invalidURL)
        }
    }

    
    //when API is fails with request invalid
    func testGetPlanetsList_WhenRequestIsInValid_AndYouDontGetData() async {
        do {
            mockNetworking.error =  NetworkAPIError.invalidURL
            _ = try await networkManager.get(url:  URL(string: "dummyURL")!)
        } catch {
            XCTAssertEqual(error as! NetworkAPIError, NetworkAPIError.dataNotFound)
        }
    }
}
