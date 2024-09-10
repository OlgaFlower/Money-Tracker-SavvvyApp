//
//  MoneyModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 29.03.24.
//

import SwiftUI

struct MoneyModel: Identifiable {
    let id = UUID().uuidString
    var recordType: RecordType = .expense
    var category: Category = Category(
        moneyGroupType: .none,
        name: "CATEGORY",
        icon: "sun.min"
    )
    var moneyAmount: String = ""
    var notes: String = "Add record..."
    var currency: String = "EUR"
    var timestamp: Date = Date()
}

enum RecordType: Identifiable {
    case expense
    case income
    
    /// make enum conform to Idetifiable 
    var id: Self {
        return self
    }
    
    var value: String {
        switch self {
        case .expense:
            return "EXPENSE"
        case .income:
            return "INCOME"
        }
    }
}
