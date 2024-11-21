//
//  OnboardingView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 01.11.24.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: - States
    @StateObject private var viewModel = OnboardingViewModel()
    @State private var showCurrencyPicker = false
    @State private var showCountryPicker = false
    
    // MARK: - Properties
    let width = UIScreen.main.bounds.width / 1.5
    let height = UIScreen.main.bounds.width / 3.5
    
    // MARK: - Body
    var body: some View {
        ZStack {
            BackgroundGradView()
            
            /// Header
            VStack {
                TextLargeView(text: "welcome", alignCenter: true)
                    .padding(.top, 100)
                Spacer()
            }
            
            VStack(spacing: 2) {
                /// Country
                HStack {
                    TextSmallView(text: "Select country")
                        .opacity(0.7)
                    Spacer()
                }
                self.makeCountryView()
                    .frame(height: self.height)
                    .padding(.bottom, 40)
                
                /// Currency
                HStack {
                    TextSmallView(text: "Select currency")
                        .opacity(0.7)
                    Spacer()
                }
                self.makeCurrencyView()
                    .frame(height: self.height)
            }
            .frame(width: self.width)
            .blur(radius: (self.showCurrencyPicker || self.showCountryPicker) ? 10 : 0)
            
            /// Picker
            self.pickerView
        }
        .animation(.easeInOut(duration: 0.4), value: self.showCurrencyPicker || self.showCountryPicker)
    }
    
    // MARK: - Views
    @ViewBuilder
    private var pickerView: some View {
        /// Currency Picker
        if self.showCurrencyPicker {
            Rectangle()
                .fill(.darkBlue.opacity(0.6))
                .ignoresSafeArea()
            
            GenericPickerView(
                selectedItem: self.$viewModel.selectedCurrency,
                isPresented: self.$showCurrencyPicker,
                items: self.viewModel.currencies
            )
            .padding(.horizontal, 32)
            .transition(.scale)
        }
        
        /// Country Picker
        if self.showCountryPicker {
            Rectangle()
                .fill(.darkBlue.opacity(0.6))
                .ignoresSafeArea()
            
            GenericPickerView(
                selectedItem: self.$viewModel.selectedCountry,
                isPresented: self.$showCountryPicker,
                items: self.viewModel.countries
            )
            .padding(.horizontal, 32)
            .transition(.scale)
        }
    }
    
    // MARK: - Functions
    /// Country
    private func makeCountryView() -> some View {
        self.countryEditorView
            .onTapGesture {
                self.showCountryPicker.toggle()
            }
    }
    
    private var countryEditorView: some View {
        TextView(text: self.viewModel.selectedCountry.rawValue)
            .background {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(.lightBlue.opacity(0.5))
                    .frame(width: self.width, height: self.height)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.white.opacity(0.5), lineWidth: 0.5)
                    )
            }
    }
    
    /// Currency
    private func makeCurrencyView() -> some View {
        self.currencyEditorView
            .onTapGesture {
                self.showCurrencyPicker.toggle()
            }
    }
    
    private var currencyEditorView: some View {
        TextView(text: self.viewModel.selectedCurrency.rawValue)
            .background {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(.lightBlue.opacity(0.5))
                    .frame(width: self.width, height: self.height)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.white.opacity(0.5), lineWidth: 0.5)
                    )
            }
    }
}

#Preview {
    OnboardingView()
}
