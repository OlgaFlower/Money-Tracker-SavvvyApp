//
//  HomeViewModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 18.05.24.
//

import SwiftUI
import Combine

final class HomeViewModel: ObservableObject {
    
    @Published private(set) var todayExpenses: Int
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.todayExpenses = CalculationService.shared.todayExpenses
        
        CalculationService.shared.$todayExpenses
            .sink { [weak self] newValue in
                self?.todayExpenses = newValue
            }
            .store(in: &cancellables)
    }
    
    
    
    // MARK: - Functions
    
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
    
    /// Color
    func calcLeftoverColor(dayBudget: Double, leftover: Double) -> Color {
        let orangeLevel = dayBudget / 4 /// leftover is 25% of the budget
        let redLevel = dayBudget / 6 /// leftover is 16.6% of the budget
        
        switch leftover {
        case ..<redLevel:
            return .red
        case redLevel..<orangeLevel:
            return .orange
        default:
            return .white
        }
    }
    
    /// Vibration
    func vibrate() {
        VibrateService.vibrateMedium()
    }
    
    func vibrateLight() {
        VibrateService.vibrateLight()
    }
}
