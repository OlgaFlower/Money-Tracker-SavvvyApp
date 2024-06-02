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
        case .temporaryIncome:
            return "Temporary Expenses"
        case .regularIncome:
            return "Regular Expenses"
        case .recurringExpense:
            return "Recurring Expenses"
        case .generalExpense:
            return "General Expenses"
        case .none:
            return ""
        }
    }
}
