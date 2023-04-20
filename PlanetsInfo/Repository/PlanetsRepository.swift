//
//  PlanetsRepository.swift
//  PlanetsInfo
//
//  Created by Venkatesh Vipparthi on 19/04/2023.
//

import Foundation
protocol PlanetsRepository{
    func getPlanetsList(for url:URL) async throws -> [Planet]
}

protocol PlanetsDataUseCase{
    func getDataForPlanetsList(for urlString:String) async
}
