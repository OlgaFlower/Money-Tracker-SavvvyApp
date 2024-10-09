//
//  HomeViewModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 18.05.24.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    @ObservedObject private var dataService: DataService
    
    // MARK: - Publishers
    @Published var todayExpenses: Int = 0
    @Published var dayBudget: Double = 0.0
    @Published var leftover: Double = 0.0
    
    // MARK: - Computed Properties
    var leftoverTextColor: Color {
        self.setLeftoverColor()
    }
    
    // MARK: - Init
    init(dataService: DataService = DataService.shared) {
        self.dataService = dataService
        self.updateValues()
    }
    
    // MARK: - Functions
    func updateValues() {
        self.todayExpenses = dataService.todayExpensesSum
        self.dayBudget = dataService.dayBudget
        self.leftover = dataService.todayLeftover
    }
    
    func setLeftoverValueForChart(leftover: Double) -> Double {
        return leftover <= 0.0 ? 0.0 : leftover
    }
    
    private func setLeftoverColor() -> Color {
        let orangeLevel = self.dayBudget / 4
        let redLevel = self.dayBudget / 6
        
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
