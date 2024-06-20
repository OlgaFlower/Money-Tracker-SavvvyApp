//
//  MoneyModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 29.03.24.
//

import SwiftUI

struct MoneyModel: Identifiable {
    let id = UUID()
    var recordType: RecordType
    var category: Category
    var moneyAmount: String
    var notes: String
    var currency: String
    
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
