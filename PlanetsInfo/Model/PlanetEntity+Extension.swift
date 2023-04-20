//
//  PlanetEntity+Extension.swift
//  PlanetInfo
//
//  Created by Venkatesh Vipparthi on 19/04/2023.
//

import Foundation
import CoreData

extension PlanetEntity {
    
    static func insertPlanetEntity(planets: [Planet], moc: NSManagedObjectContext)throws {
        
        // First delete all records than save all records to avoid duplication.
        try deletePlanetsRecords(moc: moc)
        planets.forEach { planet in
            let planetEntity = NSEntityDescription.insertNewObject(forEntityName:"PlanetEntity", into: moc) as? PlanetEntity
            
            planetEntity?.name = planet.name
            planetEntity?.gravity = planet.gravity
            planetEntity?.climate = planet.climate
            planetEntity?.url = planet.url
        }
        try moc.save()
    }
    

    static func fetchAllPlanetsList(moc: NSManagedObjectContext)-> [PlanetEntity] {
        let fr = PlanetEntity.fetchRequest()
        return (try? moc.fetch(fr)) ?? []
    }
    

    static func deletePlanetsRecords(moc: NSManagedObjectContext)throws {
       let planets =  PlanetEntity.fetchAllPlanetsList(moc: moc)
        
        planets.forEach {
            moc.delete($0)
        }
        try moc.save()
    }

    func toPlanet()-> Planet {
        return Planet(name:name ?? "", rotationPeriod:"", orbitalPeriod:"", diameter:"", climate:climate ?? "", gravity:gravity ?? "", terrain: "", surfaceWater: "", population:"", residents:[""], films:[""], created:"",edited:"",url:url ?? "")
    }
}
