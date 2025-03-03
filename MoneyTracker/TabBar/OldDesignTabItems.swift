//
//  OldDesignTabItems.swift
//  Savvvy
//
//  Created by Olha Bereziuk on 15.12.24.
//

import SwiftUI

struct OldDesignTabItems: View {
    
    var body: some View {
        Group {
            NavigationStack {
                TodayView()
                    .navigationTitle("TODAY'S BUDGET")
                    .navigationBarTitleDisplayMode(.large)
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
                    .navigationTitle("CALENDAR")
                    .navigationBarTitleDisplayMode(.large)
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
        }
    }
}
