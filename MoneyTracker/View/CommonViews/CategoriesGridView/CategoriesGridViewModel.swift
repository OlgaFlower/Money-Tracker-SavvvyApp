//
//  CategoriesGridViewModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 22.05.24.
//

import Foundation

final class CategoriesGridViewModel: ObservableObject {
    // MARK: - State -
    @Published var categoryItems: MoneyCategories  = MoneyCategories(
        categoryItems: [
            Category(
                moneyGroupType: .generalExpense,
                name: "",
                icon: ""
            )
        ]
    )
    
    // MARK: - Functions -
    func itemsToDisplay(for moneyGroup: MoneyGroupType) -> [Category] {
        switch moneyGroup {
        case .temporaryIncome:
            return self.fetchTemporaryIncomeItems()
        case .regularIncome:
            return self.fetchRegularIncomeItems()
        case .generalExpense:
            return self.fetchGeneralExpensesItems()
        default: break
        }
        return []
    }
    
    func fetchGeneralExpensesItems() -> [Category] {
        Categories.fetchGeneralExpensesItems().categoryItems
    }
    
    func fetchRegularIncomeItems() -> [Category] {
        Categories.fetchRegularIncomeCategories().categoryItems
    }
    
    func fetchTemporaryIncomeItems() -> [Category] {
        Categories.fetchTemporaryIncomeCategories().categoryItems
    }
}
