//
//  ContentView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 15.03.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ///Home
            NavigationStack {
                HomeView(viewModel: HomeViewModel())
            }
            .tabItem {
                Label(
                    title: {},
                    icon: {
                        self.makeTabBarIcon("expenses")
                    }
                )
            }
            
            
            ///Test
            NavigationStack {
                TestView()
            }
            .tabItem {
                Label(
                    title: {  },
                    icon: {
                        self.makeTabBarIcon("chart")
                    }
                )
            }
            
            ///Test
            NavigationStack {
                TestView2()
            }
            .tabItem {
                Label(
                    title: {  },
                    icon: {
                        self.makeTabBarIcon("wallet")
                    }
                )
            }
            
        }
        .accentColor(.accent)
    }
    
    // MARK: - Views
    
    private func makeTabBarIcon(_ iconName: String) -> some View {
        Image(iconName)
            .renderingMode(.template)
            .foregroundStyle(.accent)
    }
}

#Preview {
    ContentView()
}
