//
//  NewRecordViewModel.swift
//  Monika
//
//  Created by Olha Bereziuk on 23.12.24.
//

import Foundation

final class NewRecordViewModel: ObservableObject {
    
    @Published var currencySign = UserPreferences.currencySign
    @Published var regularCategory: String = ""
    @Published var recurringCategory: String = ""
    @Published var recurringRange: Int = 10
    
    var isRegularCatSelected: Bool {
        !self.regularCategory.isEmpty
    }
    
    var isRecurringCatSelected: Bool {
        !self.recurringCategory.isEmpty
    }
    
    func reduceRange() {
        self.recurringRange = max(1, self.recurringRange - 1)
    }
    
    func increaseRange() {
        self.recurringRange += 1
    }
}
