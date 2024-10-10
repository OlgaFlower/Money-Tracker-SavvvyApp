//
//  ExpensesDetailViewModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 25.06.24.
//

import SwiftUI

final class ExpensesDetailViewModel: ObservableObject {
    
    @ObservedObject private var dataService: DataService
    
    // MARK: - Publishers
    @Published var generalExpenses: [MoneyModel] = []
    @Published var recurringExpenses: [MoneyModel] = []
    
    // MARK: - Init
    init(dataService: DataService = DataService.shared) {
        self.dataService = dataService
        self.loadExpenses()
    }
    
    // MARK: - Functions
    private func loadExpenses() {
        self.generalExpenses = self.makeExpensesList(forTag: 3)
        self.recurringExpenses = self.makeExpensesList(forTag: 4)
    }
    
    private func makeExpensesList(forTag tag: Int16) -> [MoneyModel] {
        return dataService.todayExpensesRecords.filter { $0.typeTag == tag }
    }
}
