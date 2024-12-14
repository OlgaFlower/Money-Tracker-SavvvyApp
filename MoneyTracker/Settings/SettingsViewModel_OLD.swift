////
////  SettingsViewModel.swift
////  MoneyTracker
////
////  Created by Olha Bereziuk on 04.12.24.
////
//
//import SwiftUI
//
//final class SettingsViewModel: ObservableObject {
//    
//    // MARK: - Publishers
//    @Published var tempLanguage: String = ""
//    @Published var tempCountry: String = ""
//    @Published var tempCurrency: String = ""
//    @Published var isButtonActive: Bool = false
//    
//    // MARK: - UserDefaults
//    @AppStorage("userCurrency") var currency: String = "EUR"
//    @AppStorage("userCountry") var country: String = "Ukraine"
//    @AppStorage("userLanguage") var language: String = "English"
//    
//    // MARK: - Init
//    init() {
//        self.tempLanguage = self.language
//        self.tempCountry = self.country
//        self.tempCurrency = self.currency
//    }
//    
//    // MARK: - Functions
//    func vibrate() {
//        VibrateService.vibrateMedium()
//    }
//    
//    func checkForChanges() {
//        self.isButtonActive = tempLanguage != language || tempCountry != country || tempCurrency != currency
//    }
//    
//    func saveChanges() {
//        if tempLanguage != language {
//            UserPreferences.language = self.tempLanguage
//        }
//        if tempCountry != country {
//            UserPreferences.country = self.tempCountry
//        }
//        if tempCurrency != currency {
//            UserPreferences.currency = self.tempCurrency
//            
//            let sign = Currency(rawValue: tempCurrency)?.sign ?? "€"
//            UserPreferences.currencySign = sign
//        }
//    }
//}
