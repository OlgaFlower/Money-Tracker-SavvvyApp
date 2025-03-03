//
//  NewDesignTabItems.swift
//  Savvvy
//
//  Created by Olha Bereziuk on 15.12.24.
//

import SwiftUI

struct NewDesignTabItems: View {
    
    var body: some View {
        
        NavigationStack {
            HomeView()
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
    }
}
