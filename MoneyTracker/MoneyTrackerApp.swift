//
//  MoneyTrackerApp.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 15.03.24.
//

import SwiftUI

@main
struct MoneyTrackerApp: App {
    
    // MARK: - Properties -
    private let dataController = PersistenceController()
    
    // MARK: - Init -
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
          /// Inline Navigation Title
          UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    // MARK: - Body -
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, self.dataController.container.viewContext)
        }
    }
}
