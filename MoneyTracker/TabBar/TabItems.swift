//
//  TabItems.swift
//  Savvvy
//
//  Created by Olha Bereziuk on 15.12.24.
//

import SwiftUI

struct TabItems: View {
    
    var body: some View {
        Group {
            NavigationStack {
                HomeView(viewModel: HomeViewModel())
            }
            .tabItem {
                Label(
                    title: {},
                    icon: {
                        Image("expenses")
                            .renderingMode(.template)
                    }
                )
            }
            
            NavigationStack {
                CalendarView()
            }
            .tabItem {
                Label(
                    title: {},
                    icon: {
                        Image("calendar")
                            .renderingMode(.template)
                    }
                )
            }
            
            NavigationStack {
                SettingsView()
            }
            .tabItem {
                Label(
                    title: {},
                    icon: {
                        Image("settings")
                            .renderingMode(.template)
                    }
                )
            }
        }
    }
}
