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
        let digits = inputString.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        
        // Check if the input is all zeros
        if digits == "000" {
            return "0" + decimalSeparator + "00"
        }
        
        // Ensure we always have at least 3 digits
        let number = digits.padLeft(toLength: 3, withPad: "0")
        
        // Separate integer and decimal parts
        let integerPart = String(number.dropLast(2))
        let decimalPart = String(number.suffix(2))
        
        // Format integer part with thousands separator
        var formattedInteger = ""
        for (index, char) in integerPart.reversed().enumerated() {
            if index > 0 && index % 3 == 0 {
                formattedInteger = " " + formattedInteger
            }
            formattedInteger = String(char) + formattedInteger
        }
        
        // Combine integer and decimal parts
        let formattedNumber = formattedInteger + decimalSeparator + decimalPart
        
        return formattedNumber
    }
}
