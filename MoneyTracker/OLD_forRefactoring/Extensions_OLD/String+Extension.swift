//
//  String+Extension.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 17.05.24.
//

import Foundation

extension String {
    
    /// Manages numbers with leading zeros (CurrencyTextFieldView)
    func padLeft(toLength length: Int, withPad pad: Character) -> String {
        let paddingLength = length - self.count
        if paddingLength > 0 {
            return String(repeating: pad, count: paddingLength) + self
        }
        return self
    }
    
    func toInt64() -> Int64 {
        return Int64(Double(self) ?? 0)
    }
}
