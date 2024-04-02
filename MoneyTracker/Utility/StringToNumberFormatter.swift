//
//  StringToNumberFormatter.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 01.04.24.
//

import Foundation

struct StringToNumberFormatter {
    
    private var number = NumberFormatter()
    
    private func formatResultForregion(basedOn: String) -> String {
        if let stringAsNumber = Double(basedOn) {
            let numberNs = NSNumber(value: stringAsNumber)
            return number.string(from: numberNs) ?? ""
        }
        print("DEBUG: This value is not a number")
        return ""
    }
}
