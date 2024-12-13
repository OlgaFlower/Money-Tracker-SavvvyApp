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
                    self.makeLogoView(smallScreen: isSmallScreen)
                    
                    VStack(spacing: 0) {
                        self.makeTitleView(smallScreen: isSmallScreen)
                        self.makeSubtitleView(smallScreen: isSmallScreen)
                        self.countryButton
                        self.currencyButton
                        self.letsGoButton
                        Spacer()
                    }
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
                    default:
                        // TODO: -
                        EmptyView()
                    }
                }
            }
        }
    }
    
    // MARK: - Views
    /// Logo
    private func makeLogoView(smallScreen: Bool) -> some View {
        VStack(spacing: 0) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: smallScreen ? 80 : 110)
            self.logo
            Spacer()
        }
    }
    
    private var logo: some View {
        HStack {
            Image("logo")
            Spacer()
        }
    }
    
    /// Title
    private func makeTitleView(smallScreen: Bool) -> some View {
        VStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: smallScreen ? 197 : 227)
            HStack {
                Text("Welcome to ")
                    .font(.system(size: 29, weight: .heavy, design: .default))
                Image("nameLogo")
                    .renderingMode(.template)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                Spacer()
            }
            .padding(.top, 28)
            .padding(.leading, 39)
            
        }
    }
    
    /// Subtitle
    private func makeSubtitleView(smallScreen: Bool) -> some View {
        HStack {
            Text("Select country & currency to start:")
                .font(.system(size: smallScreen ? 16 : 18, weight: .bold, design: .default))
                .foregroundStyle(.tertiary)
            Spacer()
        }
        .padding(.leading, 39)
        .padding(.top, 10)
    }
    
    /// Country selector
    private var countryButton: some View {
        SelectorButtonView(
            title: self.viewModel.selectedCountry.rawValue,
            systemIconName: "flag.fill"
        )
            .padding(.horizontal, 27)
            .padding(.top, 28)
            .onTapGesture {
                self.path.append("Country")
            }
    }
    
    /// Currency selector
    private var currencyButton: some View {
        SelectorButtonView(
            title: self.viewModel.selectedCurrency.rawValue,
            systemIconName: "coloncurrencysign.circle.fill"
        )
            .padding(.horizontal, 27)
            .padding(.top, 12)
            .onTapGesture {
                self.path.append("Currency")
            }
    }
    
    /// Let's go button
    private var letsGoButton: some View {
        PinkButtonView(title: "Let's go")
            .padding(.horizontal, 27)
            .padding(.top, 30)
            .onTapGesture {
                self.viewModel.savePreferences()
                self.viewModel.vibrate()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.viewModel.vibrate()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        self.isFirstLaunch.toggle()
                    }
                }
            }
    }
    
}

#Preview {
    OnboardingView(isFirstLaunch: .constant(false))
}
