//
//  HomeViewModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 18.05.24.
//

import SwiftUI
import Combine

final class HomeViewModel: ObservableObject {
    // MARK: - States
    @Published private(set) var todayExpenses: Int
    @Published private(set) var dayBudget: Double
    @Published private(set) var leftover: Double
    
    // MARK: - Properties
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Init
    init() {
        self.todayExpenses = DataService.shared.todayExpensesSum
        self.dayBudget = DataService.shared.dayBudget
        self.leftover = DataService.shared.todayLeftover
        
        DataService.shared.$todayExpensesSum
            .sink { [weak self] newValue in
                self?.todayExpenses = newValue
            }
            .store(in: &cancellables)
        
        DataService.shared.$dayBudget
            .sink { [weak self] newValue in
                self?.dayBudget = newValue
            }
            .store(in: &cancellables)
        
        DataService.shared.$todayLeftover
            .sink { [weak self] newValue in
                self?.leftover = newValue
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Functions
    func setLeftoverValueForChart(leftover: Double) -> Double {
        return leftover <= 0.0 ? 0.0 : leftover
    }
    
    /// Color
    func setLeftoverColor() -> Color {
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
    
    /// Vibration
    func vibrate() {
        VibrateService.vibrateMedium()
    }
    
    func vibrateLight() {
        VibrateService.vibrateLight()
    }
}
