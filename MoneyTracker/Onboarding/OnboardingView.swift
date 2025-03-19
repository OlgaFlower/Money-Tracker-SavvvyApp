//
//  OnboardingView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 01.11.24.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    // MARK: - States
    @StateObject private var viewModel = OnboardingViewModel()
    @State private var path = NavigationPath()
    @Binding var isFirstLaunch: Bool
    
    // MARK: - Body
    var body: some View {
        NavigationStack(path: $path) {
            
            GeometryReader { geometry in
                /// UI adjusted for iPhones with small screen (screen width of the iPhone SE 3-g)
                let isSmallScreen = geometry.size.width < 376
                
                ZStack {
                    OnboardingBackgroundView()
                    
                    VStack(spacing: 0) {
                        self.makeSpaceView(smallScreen: isSmallScreen)
                        self.makeLogoView()
                        self.makeTitleView(smallScreen: isSmallScreen)
                        self.makeSubtitleView(smallScreen: isSmallScreen)
                        self.countryButton
                        self.currencyButton
                        self.languageButton
                        Spacer()
                    }
                    self.nextButton
                }
                .navigationDestination(for: String.self) { destination in
                    
                    switch destination {
                    case "Country":
                        SettingsDetailedListView(
                            items: Country.allCases,
                            selectedValue: $viewModel.selectedCountry
                        )
                    case "Currency":
                        SettingsDetailedListView(
                            items: Currency.allCases,
                            selectedValue: $viewModel.selectedCurrency
                        )
                    case "Language":
                        SettingsDetailedListView(
                            items: Language.allCases,
                            selectedValue: $viewModel.selectedLanguage
                        )
                    default:
                        // TODO: -
                        EmptyView()
                    }
                }
            }
        }
    }
    
    // MARK: - Views
    private func makeSpaceView(smallScreen: Bool) -> some View {
        Rectangle()
            .frame(height: smallScreen ? 50 : 80)
            .foregroundStyle(.clear)
    }
    
    // Logo
    private func makeLogoView() -> some View {
        HStack {
            Image("logo")
                .resizable()
                .frame(width: 80, height: 80)
            Spacer()
        }
        .padding(.leading, 38)
    }
    
    // Title
    private func makeTitleView(smallScreen: Bool) -> some View {
        HStack {
            Text("Welcome to Monika")
                .font(.system(size: 29, weight: .bold, design: .default))
            Spacer()
        }
        .padding(.top, 50)
        .padding(.leading, 39)
    }
    
    // Subtitle
    private func makeSubtitleView(smallScreen: Bool) -> some View {
        HStack {
            Text("Select a country, currency, and language. You can change these settings later.")
                .font(.system(size: smallScreen ? 16 : 18, weight: .regular, design: .default))
                .foregroundStyle(.primary)
            Spacer()
        }
        .padding(.horizontal, 39)
        .padding(.top, 10)
    }
    
    // Country
    private var countryButton: some View {
        SelectorButtonView(
            title: self.viewModel.selectedCountry.rawValue,
            iconName: "flag.circle.fill",
            isSelected: Binding(
                get: { self.viewModel.preselectedData },
                set: { _ in }
            ),
            action: ({
                self.path.append("Country")
            })
        )
        .padding(.horizontal, 27)
        .padding(.top, 28)
    }
    
    // Currency
    private var currencyButton: some View {
        SelectorButtonView(
            title: self.viewModel.selectedCurrency.rawValue,
            iconName: "coloncurrencysign.circle.fill",
            isSelected: Binding(
                get: { self.viewModel.preselectedData },
                set: { _ in }
            ),
            action: ({
                self.path.append("Currency")
            })
        )
        .padding(.horizontal, 27)
        .padding(.top, 12)
    }
    
    // Lnguage
    private var languageButton: some View {
        SelectorButtonView(
            title: self.viewModel.selectedLanguage.rawValue,
            iconName: "globe.europe.africa.fill",
            isSelected: Binding(
                get: { self.viewModel.preselectedData },
                set: { _ in }
            ),
            action: ({
                self.path.append("Language")
            })
        )
        .padding(.horizontal, 27)
        .padding(.top, 12)
    }
    
    private var nextButton: some View {
        VStack {
            Spacer()
            PinkActiveButtonView(
                title: "Start"
            ) {
                self.viewModel.savePreferences()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.viewModel.vibrate()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        self.isFirstLaunch.toggle()
                    }
                }
            }
            .padding(.bottom, 24)
        }
    }
}

#Preview {
    OnboardingView(isFirstLaunch: .constant(false))
}
