//
//  StringExtension.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 17.05.24.
//

import Foundation

extension String {
    
    func formatAsCurrency() -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        /// Current locale for currency separator
        formatter.locale = Locale.current
        /// Remove currency symbol
        formatter.currencySymbol = ""
        
        if let number = Double(self) {
            return formatter.string(from: NSNumber(value: number)) ?? self
        } else {
            return self
        }
    }
}
