//
//  PlanetsDetails.swift
//  PlanetsInfo
//
//  Created by Venkatesh Vipparthi on 19/04/2023.
//

import SwiftUI

struct PlanetsDetails: View {
    let planet:Planet
    var body: some View {
        VStack(alignment: .leading){
            Text("Name- \(planet.name)").font(.title).foregroundColor(.black)
            Divider()
            Text("Gravity- \(planet.gravity)").font(.title).foregroundColor(.black)
            Divider()
            Text("Climate- \(planet.climate)").font(.title).foregroundColor(.black)
            Divider()
            Spacer()
        }
    }
}

struct PlanetsDetails_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsDetails(planet: Planet.someMockPlanet())
    }
}
