//
//  HomeViewModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 18.05.24.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    @ObservedObject private var dataService: DataService
    
    // MARK: - Computed Properties
    var leftoverTextColor: Color {
        self.setLeftoverColor()
    }
    
    var todayExpenses: Int {
        dataService.todayExpensesSum
    }
    
    var dayBudget: Double {
        dataService.dayBudget
    }
    
    var leftover: Double {
        dataService.todayLeftover
    }
    
    // MARK: - Init
    init(dataService: DataService = DataService.shared) {
        self.dataService = dataService
    }
    
    // MARK: - Functions
    func setLeftoverValueForChart(leftover: Double) -> Double {
        return leftover <= 0.0 ? 0.0 : leftover
    }
    
    private func setLeftoverColor() -> Color {
        let orangeLevel = self.dayBudget / 4 /// leftover is 25% of the budget
        let redLevel = self.dayBudget / 6 /// leftover is 16.6% of the budget
        
        switch leftover {
        case ..<redLevel:
            return .red
        case redLevel..<orangeLevel:
            return .orange
        default:
            return .white
        }
    }
    
    // MARK: - Actions
    func vibrate() {
        VibrateService.vibrateMedium()
    }
    
    func vibrateLight() {
        VibrateService.vibrateLight()
    }
}
