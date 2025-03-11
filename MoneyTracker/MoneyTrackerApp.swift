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
    
    // MARK: - Init -
    init() {
        self.configureNavigationBarAppearance()
        self.configureTabBarAppearance() /// Temporary for redesign
    }
    
    // MARK: - Body -
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, viewContext)
        }
    }
    
    // MARK: - Methods
    private func configureNavigationBarAppearance() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .font: UIFont(name: CustomFont.appFont + CustomFontStyle.medium.rawValue, size: 32) ?? .systemFont(ofSize: 32),
            .foregroundColor: UIColor.white
        ]
        /// Inline Navigation Title
        UINavigationBar.appearance().titleTextAttributes = [
            .font: UIFont(name: CustomFont.appFont + CustomFontStyle.medium.rawValue, size: 17) ?? .systemFont(ofSize: 17),
            .foregroundColor: UIColor.white
        ]
    }
    
    private func configureTabBarAppearance() { /// Temporary for design
            let appearance = UITabBarAppearance()
            appearance.configureWithDefaultBackground()
            appearance.shadowColor = UIColor.gray // Set separator color
            
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
            UITabBar.appearance().unselectedItemTintColor = UIColor(named: "tabBarInactive") ?? .gray
        }
}
