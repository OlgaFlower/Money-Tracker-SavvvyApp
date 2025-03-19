//
//  CategoryType.swift
//  Monika
//
//  Created by Olha Bereziuk on 11.03.25.
//

import Foundation

enum CategoryType: Int16, CaseIterable, Identifiable {
    case generalExpense = 0
    case recurringExpense = 1
    case oneTimeIncome = 2
    case regularIncome = 3
    
    var id: Int16 { self.rawValue }
    
    var title: String {
        switch self {
        case .generalExpense:
            return "Expense"
        case .recurringExpense:
            return "Recurring Expense"
        case .oneTimeIncome:
            return "One-off Income"
        case .regularIncome:
            return "Regular Income"
        }
    }
}
