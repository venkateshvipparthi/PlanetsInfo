//
//  MockNetworking.swift
//  PlanetsInfoTests
//
//  Created by Venkatesh Vipparthi on 19/04/2023.
//

import Foundation
@testable import PlanetsInfo

class MockNetworking: Networking {
    
    var mockData: Data!
    var mockResponse: URLResponse!
    var error: Error?
    
    func data(from url: URL, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        if error != nil {
            throw error!
        }
        return (mockData, mockResponse)
    }
}
