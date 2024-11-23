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
    let height: CGFloat = 60
    
    // MARK: - Body
    var body: some View {
        ZStack {
            BackgroundGradView()
            
            self.welcomeView
            
            self.countryAndCurrencyBlock
            
            self.startBtn
            
            self.pickerView
        }
        .animation(
            .easeInOut(duration: 0.4),
            value: self.showCurrencyPicker || self.showCountryPicker
        )
    }
    
    // MARK: - Views
    private var startBtn: some View {
        VStack {
            Spacer()
            
            self.startButtonView
                .padding(.bottom, 32)
                .opacity(self.showCountryPicker || self.showCurrencyPicker ? 0 : 1)
        }
    }
    
    private var welcomeView: some View {
        VStack {
            TextLargeView(text: "welcome", alignCenter: true)
                .padding(.top, 76)
            Spacer()
        }
    }
    
    private var countryAndCurrencyBlock: some View {
        VStack(spacing: 6) {
            /// Country
            HStack {
                TextSmallView(text: "country")
                    .opacity(0.7)
                Spacer()
            }
            self.makeCountryView()
                .frame(height: self.height)
                .padding(.bottom, 24)
            
            /// Currency
            HStack {
                TextSmallView(text: "currency")
                    .opacity(0.7)
                Spacer()
            }
            self.makeCurrencyView()
                .frame(height: self.height)
            
            Spacer()
        }
        .padding(.top, 200)
        .frame(width: Constants.buttonWidth)
        .blur(radius: (self.showCurrencyPicker || self.showCountryPicker) ? 10 : 0)
    }
    
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
            .transition(.scale)
        }
    }
    
    /// Country
    private func makeCountryView() -> some View {
        self.countryEditorView
            .onTapGesture {
                self.showCountryPicker.toggle()
            }
    }
    
    private var countryEditorView: some View {
        TextView(text: self.viewModel.selectedCountry.rawValue)
            .overlay(
                RoundedRectangle(cornerRadius: Constants.cornerRadius)
                    .stroke(.white.opacity(0.5), lineWidth: 0.5)
                    .frame(width: Constants.buttonWidth, height: self.height)
            )
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
            .overlay(
                RoundedRectangle(cornerRadius: Constants.cornerRadius)
                    .stroke(.white.opacity(0.5), lineWidth: 0.5)
                    .frame(width: Constants.buttonWidth, height: self.height)
            )
    }
    
    private var startButtonView: some View {
        Button {
            self.viewModel.savePreferences()
            VibrateService.vibrateMedium()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                VibrateService.vibrateMedium()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    
                }
            }
        } label: {
            TextView(text: "start", style: .regular)
                .padding(.vertical, 10)
                .frame(width: Constants.buttonWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .fill(.white.opacity(Constants.buttonFillOpacity))
        )
        .overlay(
            RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous)
                .stroke(.white, lineWidth: 0.5)
        )
    }
}

#Preview {
    OnboardingView()
}
