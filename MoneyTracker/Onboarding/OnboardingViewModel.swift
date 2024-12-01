//
//  OnboardingViewModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 21.11.24.
//

import Foundation

final class OnboardingViewModel: ObservableObject {
    
    @Published var currencies: [Currency] = []
    @Published var countries: [Country] = []
    @Published var languages: [Language] = []
    
    @Published var selectedCurrency: Currency = .eur
    @Published var selectedCountry: Country = .ukraine
    @Published var selectedLanguage: Language = .english
    
    init() {
        self.currencies = Currency.allCases.sorted { $0.rawValue < $1.rawValue }
        self.countries = Country.allCases.sorted { $0.rawValue < $1.rawValue }
        self.languages = Language.allCases.sorted { $0.rawValue < $1.rawValue }
    }
    
    func savePreferences() {
        UserPreferences.country = self.selectedCountry.rawValue
        UserPreferences.currency = self.selectedCurrency.rawValue
        UserPreferences.currencySign = self.selectedCurrency.sign
        UserPreferences.language = self.selectedLanguage.rawValue
    }
}
