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
                CalendarView()
            }
            .tabItem {
                Label(
                    title: {},
                    icon: {
                        Image(systemName: "calendar")
                            .renderingMode(.template)
                    }
                )
            }
            
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Label(
                    title: {},
                    icon: {
                        Image(systemName: "plus")
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
                        Image(systemName: "gearshape")
                            .renderingMode(.template)
                    }
                )
            }
        }
    }
}
