//
//  ContentView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 15.03.24.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true
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
                            LazyView(TabItems())
                    }
                    .accentColor(.pink)
                }
            }
        }
    }
}

#Preview {
    return ContentView()
}
