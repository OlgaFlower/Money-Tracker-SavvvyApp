//
//  HomeViewModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 18.05.24.
//

import Foundation
import CoreData
import SwiftUI

final class HomeViewModel: ObservableObject {
    
    // MARK: - Functions -
    func calculateTodayExpenses(records: FetchedResults<Money>) -> String {
        // Array of MoneyAmounts (records from DB) is converted to Int values and then we get the sum of all values in array
        // ["1244", "54", "2"] -> [1244, 54, 2] -> 1300 (calculation: 1244+54+2 )
        
        let todayExpenses = records.filter { !$0.isIncome }
        print("TODAY EXPENSES: \(todayExpenses)")
        let sum = todayExpenses.compactMap { Int($0.moneyAmount) }.reduce(0, +)
        
        // Sum of money is converted from Int to Double and devided to 100 - to get currency value (with cents)
        // after that it formatted to String (currency format) for TextView
        // 1300/100 = 13.00 -> "13,00" (currency format)
        return String(describing: Double(sum)/100).formatAsCurrency()
    }
    
    private func calculateMonthIncome(records: FetchedResults<Money>) -> Int {
        let monthIncome = records.filter { $0.isIncome }
        print("MONTH INCOME: \(monthIncome)")
        let monthIncomeSum = monthIncome.compactMap { Int($0.moneyAmount) }.reduce(0, +)
        return monthIncomeSum
    }
    
    // For Current Month
    func calculateDailyBudget(records: FetchedResults<Money>) -> String {
        let daysInMonth = CalendarManager.getNumberOfDaysInMonth(for: Date())
        print("Days in month: \(daysInMonth)")
        let dailyBudget = self.calculateMonthIncome(records: records) / daysInMonth
        return String(describing: Double(dailyBudget)/100).formatAsCurrency()
    }
}
