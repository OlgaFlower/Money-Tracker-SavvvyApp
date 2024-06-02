//
//  RecurringCategoryCellViewModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 02.06.24.
//

import Foundation

class RecurringCategoryCellViewModel {

    let recurringGroups: [RecurringCategories] = {
        Categories.fetchRecurringExpenses()
    }()
}
