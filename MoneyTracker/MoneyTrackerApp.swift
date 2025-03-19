//
//  MoneyTrackerApp.swift
//  Monika
//
//  Created by Olha Bereziuk on 15.03.24.
//

import SwiftUI

@main
struct MoneyTrackerApp: App {
    
    // MARK: - Properties -
    private let viewContext = PersistenceController.shared.container.viewContext
    
    // MARK: - Body -
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, viewContext)
        }
    }
}
