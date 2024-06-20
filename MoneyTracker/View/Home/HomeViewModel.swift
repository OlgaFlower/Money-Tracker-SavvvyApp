//
//  HomeViewModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 18.05.24.
//

import SwiftUI

final class HomeViewModel {
    
    // MARK: - Functions
    /// Expenses
    func calcExpenses(records: FetchedResults<Money>) -> Int {
        // Array of MoneyAmounts (records from DB) is converted to Int values and then we get the sum of all values in array
        // ["1244", "54", "2"] -> [1244, 54, 2] -> 1300 (calculation: 1244+54+2 )
        
        let todayExpenses = records.filter { !$0.isIncome }
        let sum = todayExpenses.compactMap { Int($0.moneyAmount) }.reduce(0, +)
        // Sum of money is converted from Int to Double and devided to 100 - to get currency value (with cents)
        // after that it formatted to String (currency format) for TextView
        // 1300/100 = 13.00 -> "13,00" (currency format)
        return sum
    }
    
    /// Month Income
    func calcDayBudget(records: FetchedResults<Money>) -> Double {
        let daysInMonth = CalendarManager.getNumberOfDaysInMonth(for: Date())
        let dailyBudget = self.calcMonthIncome(records: records) / daysInMonth
        
        return Double(dailyBudget)/100
    }
    
    func setLeftoverValueForChart(leftover: Double) -> Double {
        return leftover <= 0.0 ? 0.0 : leftover
    }
    
    private func calcMonthIncome(records: FetchedResults<Money>) -> Int {
        let monthIncome = records.filter { $0.isIncome }
        let monthIncomeSum = monthIncome.compactMap { Int($0.moneyAmount) }.reduce(0, +)
        return monthIncomeSum
    }
    
    func calcLeftover(dayBudget: Double, expenses: Int) -> Double {
        let budgetInt = Int(dayBudget * 100)
        return Double(budgetInt - expenses)/100
    }
    
    func convertToString(intValue: Int) -> String {
        return String(describing: Double(intValue)/100)
    }
}
