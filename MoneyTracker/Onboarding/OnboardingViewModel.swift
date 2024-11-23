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
    
    @Published var selectedCurrency: Currency = .eur
    @Published var selectedCountry: Country = .ukraine
    
    init() {
        self.currencies = Currency.allCases.sorted { $0.rawValue < $1.rawValue }
        self.countries = Country.allCases.sorted { $0.rawValue < $1.rawValue }
    }
}
