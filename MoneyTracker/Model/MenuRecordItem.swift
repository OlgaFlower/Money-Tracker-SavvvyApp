//
//  MenuRecordItem.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 02.04.24.
//

import Foundation

enum MenuRecordItem {
    case smallExpense
    case largeExpense
    case recurringExpense
    case income
    
    var title: String {
        switch self {
        case .smallExpense:
            "Small Expense"
        case .largeExpense:
            "Large Expense"
        case .recurringExpense:
            "Recurring Expense"
        case .income:
            "Income"
        }
    }
    var icon: String {
        switch self {
        case .smallExpense:
            "smallExpense"
        case .largeExpense:
            "largeExpense"
        case .recurringExpense:
            "recurringExpense"
        case .income:
            "income"
        }
    }
}
