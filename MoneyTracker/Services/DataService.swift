//
//  DataService.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 29.09.24.
//

import Foundation
import CoreData

final class DataService: ObservableObject {
    
    static let shared = DataService()
    
    @Published private(set) var todayExpensesSum: Int = 0
    
    var todayExpensesRecords: [MoneyModel] {
        return CoreDataManager.shared.fetchExpensesForDay(date: Date.now)
    }
    
    private init() {
        updateTodayExpenses()
    }
    
    func updateTodayExpenses() {
        self.todayExpensesSum = calcTodayExpenses()
    }
}

extension DataService {
    
    private func calcTodayExpenses() -> Int {
        let expenses = CoreDataManager.shared.fetchExpensesForDay(date: Date.now)
        let sum = expenses.reduce(0) { $0 + Int($1.moneyAmount) }
        return sum
    }
}
