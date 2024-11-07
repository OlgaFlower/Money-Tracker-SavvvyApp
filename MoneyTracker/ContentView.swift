//
//  ContentView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 15.03.24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = .tabBarInactive
    }
    
    var body: some View {
        TabView {
            
            /// Test
            NavigationStack {
                OnboardingView()
            }
            .tabItem {
                Label(
                    title: {},
                    icon: {
                        self.makeTabBarIcon("chart")
                    }
                )
            }
            
            ///Home
            NavigationStack {
                TodayView()
                    .navigationTitle("TODAY'S BUDGET")
                    .navigationBarTitleDisplayMode(.large)
            }
            .tabItem {
                Label(
                    title: {},
                    icon: {
                        self.makeTabBarIcon("expenses")
                    }
                )
            }
            ///Calendar
            NavigationStack {
                CalendarView()
                    .navigationTitle("CALENDAR")
                    .navigationBarTitleDisplayMode(.large)
            }
            .tabItem {
                Label(
                    title: {},
                    icon: {
                        self.makeTabBarIcon("calendar")
                    }
                )
            }
        }
        .accentColor(.white)
    }
    
    // MARK: - Views
    
    private func makeTabBarIcon(_ iconName: String) -> some View {
        Image(iconName)
            .renderingMode(.template)
    }
}

#Preview {
    return ContentView()
}
