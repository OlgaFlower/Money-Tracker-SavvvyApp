//
//  ContentView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 15.03.24.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true
    @AppStorage("selectedDesign") private var selectedDesign: String = "old"
    @State private var isSplashActive: Bool = true
    
    var body: some View {
        ZStack {
            
            if isSplashActive {
                SplashScreenView(isSplashActive: $isSplashActive)
                
            } else {
                if self.isFirstLaunch {
                    OnboardingView(isFirstLaunch: self.$isFirstLaunch)
                    
                } else {
                    TabView {
                        /// Home NEW
                        NavigationStack {
                            DesignSwitcherView(selectedDesign: self.$selectedDesign)
                        }
                        .tabItem {
                            Label(
                                title: {},
                                icon: {
                                    self.makeTabBarIcon("toggle")
                                }
                            )
                        }
                        
                        if selectedDesign == "old" {
                            LazyView(OldDesignTabItems())
                        }
                        
                        if selectedDesign == "new" {
                            LazyView(NewDesignTabItems())
                        }
                    }
                    .accentColor(.pink)
                }
            }
        }
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
