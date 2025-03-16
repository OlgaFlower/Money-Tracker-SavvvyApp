//
//  Int+String.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 25.06.24.
//

import Foundation

extension Int64 {
    
    func toString() -> String {
        return (Double(self) / 100).formatAsCurrency() /// example, 32.00
    }
}

extension Int {
    
    func toString() -> String {
        return (Double(self) / 100).formatAsCurrency()
    }
}
