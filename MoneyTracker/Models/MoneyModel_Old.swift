//
//  MoneyModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 29.03.24.
//

import SwiftUI

struct MoneyModel: Identifiable, Equatable {
    var id: String = ""
    var recordType: RecordType = .expense
    var category: Category_old = Category_old(
        moneyGroupType: .none,
        name: "CATEGORY",
        icon: "sun.min"
    )
    var moneyAmount: Int64 = 0
    var notes: String = ""
    var currency: String = ""
    var timestamp: Date = Date()
    var typeTag: Int = 0
    
    static func == (lhs: MoneyModel, rhs: MoneyModel) -> Bool {
            return lhs.id == rhs.id &&
                   lhs.recordType == rhs.recordType &&
                   lhs.category == rhs.category &&
                   lhs.moneyAmount == rhs.moneyAmount &&
                   lhs.notes == rhs.notes &&
                   lhs.currency == rhs.currency &&
                   lhs.timestamp == rhs.timestamp &&
                   lhs.typeTag == rhs.typeTag
        }
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
