//
//  PlanetsInfoApp.swift
//  PlanetsInfo
//
//  Created by Admin on 19/04/2023.
//

import SwiftUI

@main
struct PlanetsInfoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
