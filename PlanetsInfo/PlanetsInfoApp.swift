//
//  PlanetsInfoApp.swift
//  PlanetsInfo
//
//  Created by Venkatesh Vipparthi on 19/04/2023.
//

import SwiftUI

@main
struct PlanetsInfoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            PlanetListView(viewModel: PlanetsViewModel(planetsRepository: PlanetsRepositoryImplemantation(networkAPIManager: NetworkApiManager())))
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
