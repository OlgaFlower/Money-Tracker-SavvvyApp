//
//  UserPreferences.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 23.11.24.
//

import SwiftUI

struct UserPreferences {
    static let currencyKey = "userCurrency"
    static let currencySignKey = "userCurrencySign"
    static let countryKey = "userCountry"
    
    @AppStorage(currencyKey) static var currency: String = ""
    @AppStorage(currencySignKey) static var currencySign: String = ""
    @AppStorage(countryKey) static var country: String = ""
}
