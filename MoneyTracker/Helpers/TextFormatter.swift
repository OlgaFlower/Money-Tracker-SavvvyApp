//
//  TextFormatter.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 07.05.24.
//

import Foundation

final class TextFormatter {
    
    private init() {}
    
    // MARK: - Text to Currency format
    static func textToCurrency(_ inputString: String) -> String {
        
        let decimalSeparator = Locale.current.decimalSeparator ?? "."
        
        // Remove non-numeric characters
        let cleanAmount = inputString.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        
        // Separate integer and decimal parts
        let length = cleanAmount.count
        let integerPart = length > 2 ? String(cleanAmount.prefix(length - 2)) : cleanAmount
        let decimalPart = length > 2 ? String(cleanAmount.suffix(2)) : ""
        
        // Format integer part with thousands separator
        var formattedInteger = ""
        for (index, char) in integerPart.reversed().enumerated() {
            if index > 0 && index % 3 == 0 {
                formattedInteger = " " + formattedInteger
            }
            formattedInteger = String(char) + formattedInteger
        }
        
        // Combine integer and decimal parts
        let formattedAmount = formattedInteger + (decimalPart.isEmpty ? "" : decimalSeparator + decimalPart)
        
        return formattedAmount
    }
}
