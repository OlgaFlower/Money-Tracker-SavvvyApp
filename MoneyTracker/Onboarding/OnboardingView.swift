//
//  OnboardingView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 01.11.24.
//

import SwiftUI

struct OnboardingView: View {
    
    @State var selectedCurrency: String = Currency.eur.rawValue
    @State private var isCurrencyPickerPresented = false
    
    var body: some View {
        ZStack {
            BackgroundGradView()
            
            VStack {
                TextLargeView(text: "welcome", alignCenter: true)
                    .padding(.top, 100)
                Spacer()
            }
            
            VStack(spacing: 32) {
                self.makeCurrencyEditor()
            }
            .padding(.horizontal, 30)
            .blur(radius: isCurrencyPickerPresented ? 10 : 0)
            
            self.currencyPickerView
        }
        .animation(.easeInOut(duration: 0.4), value: self.isCurrencyPickerPresented)
    }
    
    // MARK: - Views
    @ViewBuilder
    private var currencyPickerView: some View {
        if self.isCurrencyPickerPresented {
            Rectangle()
                .fill(.darkBlue.opacity(0.6))
                .ignoresSafeArea()
            
            CurrencyPickerView(
                selectedCurrency: self.$selectedCurrency,
                isPresented: self.$isCurrencyPickerPresented
            )
            .padding(.horizontal, 32)
            .transition(.scale)
        }
    }
    
    // MARK: - Functions
    private func makeCurrencyEditor() -> some View {
        self.currencyEditorView
            .onTapGesture {
                self.isCurrencyPickerPresented.toggle()
            }
    }
    
    private var currencyEditorView: some View {
        TextHeaderView(text: self.selectedCurrency, alignCenter: true)
    }
}

#Preview {
    OnboardingView(
        selectedCurrency: "EUR"
    )
}
