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
    
    // MARK: - Publishers
    @Published private(set) var todayExpensesSum: Int = 0
    @Published private(set) var dayBudget: Double = 0.0
    @Published private(set) var todayLeftover: Double = 0.0
    
    // MARK: - Properties
    private let dataManager: CoreDataManager
    private let calendarManager: CalendarManager
    
    // MARK: - Computed properties
    var todayExpensesRecords: [MoneyModel] {
        self.dataManager.fetchExpensesForDay(date: Date.now)
    }
    
    // MARK: - Init
    private init(
        dataManager: CoreDataManager = CoreDataManager.shared,
        calendarManager: CalendarManager = CalendarManager.shared
    ) {
        self.dataManager = dataManager
        self.calendarManager = calendarManager
        self.updateTodayMoneyValues()
    }
    
    // MARK: - Functions
    func updateTodayMoneyValues() {
        self.todayExpensesSum = self.calcTodayExpenses()
        self.dayBudget = self.calcDayBudgetForCurrentMonth()
        self.todayLeftover = self.calcTodayLeftover()
    }
    
    func getRecordById(recordId: String) -> MoneyModel? {
        return self.dataManager.fetchRecordById(recordId: recordId)
    }
    
    func getRecords(for date: Date) -> [MoneyModel] {
        return self.dataManager.fetchRecords(for: date)
    }
    
    func deleteRecord(
        recordId: String,
        in viewContext: NSManagedObjectContext
    ) {
        self.dataManager.deleteRecord(
            recordId: recordId,
            in: viewContext
        )
    }
    
    func saveEditedRecord(
        id: String,
        timestamp: Date,
        moneyAmount: Int64,
        categoryName: String,
        categoryIcon: String,
        notes: String?,
        typeTag: Int16,
        using managedObjectContext: NSManagedObjectContext
    ) {
        self.dataManager.makeNewRecordWith(
            id: id,
            moneyAmount: moneyAmount,
            currency: "",
            isIncome: false,
            categoryName: categoryName,
            categoryIcon: categoryIcon,
            timestamp: timestamp,
            notes: notes,
            typeTag: typeTag,
            using: managedObjectContext
        )
    }
}

// MARK: - Extension
extension DataService {
    
    private func calcTodayExpenses() -> Int {
        let expenses = self.dataManager.fetchExpensesForDay(date: Date.now)
        let sum = expenses.reduce(0) { $0 + Int($1.moneyAmount) }
        return sum
    }
    
    private func calcCurrentMonthIncome() -> Int {
        let currentDate = Date()
        let calendar = Calendar.current
        let currentMonth = calendar.component(.month, from: currentDate)
        let currentYear = calendar.component(.year, from: currentDate)
        let incomes = self.dataManager.fetchMonthIncomeRecords(
            for: currentMonth,
            year: currentYear
        )
        let sum = incomes.reduce(0) { $0 + Int($1.moneyAmount) }
        return sum
    }
    
    private func calcDayBudgetForCurrentMonth() -> Double {
        let daysInMonth = self.calendarManager.getNumberOfDaysInMonth(for: Date())
        let dailyBudget = self.calcCurrentMonthIncome() / daysInMonth
        return Double(dailyBudget)/100
    }
    
    private func calcTodayLeftover() -> Double {
        let budgetInt = Int(self.dayBudget * 100)
        return Double(budgetInt - self.todayExpensesSum)/100
    }
}
