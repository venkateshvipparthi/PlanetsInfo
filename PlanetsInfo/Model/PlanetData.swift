//
//  PlanetData.swift
//  PlanetsInfo
//
//  Created by Venkatesh Vipparthi on 19/04/2023.
//

import Foundation

// MARK: - PlanetData
struct PlanetData: Decodable {
    let count: Int
    let next: String
    let previous: JSONNull?
    let results: [Planet]
}

// MARK: - Planet
struct Planet: Decodable {
    let name, rotationPeriod, orbitalPeriod, diameter: String
    let climate, gravity, terrain, surfaceWater: String
    let population: String
    let residents, films: [String]
    let created, edited: String
    let url: String
    var id = UUID()
    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter, climate, gravity, terrain
        case surfaceWater = "surface_water"
        case population, residents, films, created, edited, url
    }
}
extension Planet:Identifiable{
    static func someMockPlanet() -> Planet {
        return Planet(name:"Tatooine", rotationPeriod:"23", orbitalPeriod:"304", diameter:"", climate:"", gravity:"", terrain: "", surfaceWater: "", population:"", residents:[""], films:[""], created:"",edited:"",url:"")
    }
}
// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
