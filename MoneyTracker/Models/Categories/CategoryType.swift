//
//  CategoryType.swift
//  Monika
//
//  Created by Olha Bereziuk on 11.03.25.
//

import Foundation

enum CategoryType: String, CaseIterable, Identifiable {
    case generalExpense = "Expense"
    case recurringExpense = "Recurring Expense"
    case oneTimeIncome = "One-off Income"
    case regularIncome = "Regular Income"
    
    var id: String { self.rawValue }
}
