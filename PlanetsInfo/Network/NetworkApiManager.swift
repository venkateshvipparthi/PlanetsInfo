//
//  NetworkApiManager.swift
//  PlanetsInfo
//
//  Created by Venkatesh Vipparthi on 19/04/2023.
//

import Foundation
protocol Networkable {
    func get(url: URL) async throws -> Data
}

struct NetworkApiManager {
    let urlSession: Networking
    init(urlSession: Networking =  URLSession.shared) {
        self.urlSession = urlSession
    }
}

extension NetworkApiManager :Networkable{
    func get(url: URL) async throws -> Data {
        do {
            let (data, _) = try await  urlSession.data(from: url)
            return data
        } catch {
            throw NetworkAPIError.dataNotFound
        }
    }
    
}
