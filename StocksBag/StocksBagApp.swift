//
//  StocksBagApp.swift
//  StocksBag
//
//  Created by Anthony on 15/06/21.
//

import SwiftUI

@main
struct StocksBagApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
