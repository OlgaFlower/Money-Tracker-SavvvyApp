//
//  ExpensesDetailViewModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 25.06.24.
//

import SwiftUI

final class ExpensesDetailViewModel: ObservableObject {
    
    @Published var generalExpenses: [MoneyModel] = []
    @Published var recurringExpenses: [MoneyModel] = []
    private let todayExpenses = DataService.shared.todayExpensesRecords
    
    init() {
        self.loadExpenses()
    }
    
    private func loadExpenses() {
        self.generalExpenses = self.makeExpensesList(forTag: 3)
        self.recurringExpenses = self.makeExpensesList(forTag: 4)
    }
    
    private func makeExpensesList(forTag tag: Int16) -> [MoneyModel] {
        return todayExpenses.filter { $0.typeTag == tag }
    }
}
