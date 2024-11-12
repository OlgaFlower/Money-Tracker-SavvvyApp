//
//  OnboardingView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 01.11.24.
//

import SwiftUI

struct OnboardingView: View {
    
    @State var selectedCountry: String = ""
    @State var selectedCurrency: String = ""
    
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
                    input: self.$selectedCountry,
                    placeholder: "your country name",
                    suggestions: Country.self
                )
                
                BorderedTextInputView<Currency>(
                    input: self.$selectedCurrency,
                    placeholder: "currency",
                    suggestions: Currency.self
                )
            }
            .padding(.horizontal, 32)
        }
    }
}

#Preview {
    OnboardingView(
        selectedCountry: "ukraine",
        selectedCurrency: "EUR"
    )
}
