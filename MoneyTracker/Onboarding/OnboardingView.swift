//
//  OnboardingView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 01.11.24.
//

import SwiftUI

struct OnboardingView: View {
    
    @State var countryName: String = ""
    @State var currency: String = ""
    
    var body: some View {
        ZStack {
            BackgroundGradView()
            
            VStack {
                TextHeaderView(text: "welcome", alignCenter: true)
                    .padding(.top, 100)
                Spacer()
            }
            
            VStack(spacing: 32) {
                BorderedTextInputView<Country>(
                    input: self.$countryName,
                    placeholder: "your country name", 
                    suggestions: Country.self
                )
                
                BorderedTextInputView<Country>(
                    input: self.$currency,
                    placeholder: "currency", 
                    suggestions: Country.self
                )
            }
            .padding(.horizontal, 32)
        }
    }
}

#Preview {
    OnboardingView(
        countryName: "ukraine",
        currency: "EUR"
    )
}
