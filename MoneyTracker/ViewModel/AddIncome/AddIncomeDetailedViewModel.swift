//
//  AddIncomeDetailedViewModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 06.04.24.
//

import Foundation

class AddIncomeDetailedViewModel: ObservableObject {
    
    @Published var selectedIncomeType: IncomeModel
    
    init(selectedIncomeType: IncomeModel) {
        self.selectedIncomeType = selectedIncomeType
    }
}
