//
//  MoneySectionType.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 21.05.24.
//

import Foundation

enum MoneyGroupType {
    case temporaryIncome
    case regularIncome
    case recurringExpense
    case generalExpense
    case none
    
    var string: String {
        switch self {
        case .regularIncome:
            return "Regular Expenses"
        case .temporaryIncome:
            return "Temporary Expenses"
        case .generalExpense:
            return "General Expenses"
        case .recurringExpense:
            return "Recurring Expenses"
        case .none:
            return ""
        }
    }
    
    var typeTag: Int16 {
        switch self {
        case .regularIncome:
            return 1
        case .temporaryIncome:
            return 2
        case .generalExpense:
            return 3
        case .recurringExpense:
            return 4
        case .none:
            return 0
        }
    }
}
