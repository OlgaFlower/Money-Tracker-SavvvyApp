//
//  OnboardingBackgroundView.swift
//  Monika
//
//  Created by Olha Bereziuk on 12.12.24.
//

import SwiftUI

struct OnboardingBackgroundView: View {
    
    var body: some View {
        
        ZStack {
            self.topComponentView
            self.bottomComponentView
        }
        .ignoresSafeArea()
    }
    
    private var topComponentView: some View {
        VStack {
            HStack {
                Spacer()
                Image("component_1")
            }
            Spacer()
        }
    }
    
    private var bottomComponentView: some View {
        VStack {
            Spacer()
            HStack {
                Image("component_2")
                Spacer()
            }
        }
    }
}

#Preview {
    OnboardingBackgroundView()
}
