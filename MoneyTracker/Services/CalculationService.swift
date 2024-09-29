//
//  CalculationService.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 29.09.24.
//

import Foundation

final class CalculationService: ObservableObject {
    
    static let shared = CalculationService()
    
    @Published private(set) var todayExpenses: Int = 0
    
    private init() {
        updateTodayExpenses()
    }
    
    func updateTodayExpenses() {
        todayExpenses = calcTodayExpenses()
    }
}

extension CalculationService {
    
    private func calcTodayExpenses() -> Int {
        let expenses = CoreDataManager.shared.fetchExpensesForDay(date: Date.now)
        
        let sum = expenses.compactMap { expense -> Int? in
            guard let doubleValue = Double(expense.moneyAmount) else { return nil }
            
            return Int(doubleValue * 100)
        }.reduce(0, +)
        
        return sum
    }
}
