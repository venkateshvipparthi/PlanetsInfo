//
//  PlanetsRepositoryImplemantation.swift
//  PlanetsInfo
//
//  Created by Venkatesh Vipparthi on 19/04/2023.
//

import Foundation

final class PlanetsRepositoryImplemantation{
    
    var networkAPIManager:Networkable
    private let persistance:PersistenceController
    
    init(networkAPIManager: Networkable, persistance: PersistenceController = .shared) {
        self.networkAPIManager = networkAPIManager
        self.persistance = persistance
    }
    
    
}

extension PlanetsRepositoryImplemantation:PlanetsRepository{
    func getPlanetsList(for url: URL) async throws -> [Planet] {
        let data =  try? await self.networkAPIManager.get(url: url)
        var plnetsList:[Planet]?
        
        if let data = data{
            let parsedResponse = try? JSONDecoder().decode(PlanetData.self, from: data)
            plnetsList = parsedResponse?.results
        }
        if let plnetsList =  plnetsList{
            // Saving Data into Core Data
            try PlanetEntity.insertPlanetEntity(planets: plnetsList, moc: persistance.container.viewContext)
            return plnetsList
        }else{
            // Reading data from coredata and return the palnet List
            let planetEntityList = PlanetEntity.fetchAllPlanetsList(moc: persistance.container.viewContext)
            
            //Map core data PlanetEntity to Planet
            return planetEntityList.map { $0.toPlanet() }
        }
    }
    
    
}
