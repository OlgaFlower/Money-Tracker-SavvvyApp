//
//  NewRecordViewModel.swift
//  Monika
//
//  Created by Olha Bereziuk on 23.12.24.
//

import Foundation

struct Record {
    var id: UUID = UUID()
    var categoryType: CategoryType = .generalExpense
    var category = Category(
        name: "",
        icon: "",
        color: .blue
    )
    var description: String = ""
}

final class NewRecordViewModel: ObservableObject {
    
    @Published var newRecord = Record()
    @Published var segemntedControlTag: Int = 0 // Segmented control - Expense/Income
    @Published var inputAmount = ""
    @Published var currencySign = UserPreferences.currencySign
    @Published var recurringCatTapped = false
    @Published var recurringRange: Int = 1
    
    let controlOptions = ["Expense", "Income"]
    
    var regularCatPrepared: Bool {
        (self.newRecord.categoryType == .generalExpense || self.newRecord.categoryType == .oneTimeIncome)
                && !self.newRecord.category.name.isEmpty
    }
    
    var recurringCatPrepared: Bool {
        (self.newRecord.categoryType == .recurringExpense || self.newRecord.categoryType == .regularIncome)
                && !self.newRecord.category.name.isEmpty
    }
    
    var regularCatTitle: String {
        let title = segemntedControlTag == 0 ? "General" : "One-Time"
        return self.regularCatPrepared ? self.newRecord.category.name : title
    }
    
    var regularCatIcon: String {
        self.regularCatPrepared ? self.newRecord.category.icon : "cart.circle.fill"
    }
    
    var recurringCatTitle: String {
        let title = segemntedControlTag == 0 ? "Recurring" : "Regular"
        return self.recurringCatPrepared ? self.newRecord.category.name : title
    }
    
    var recurringCatIcon: String {
        self.recurringCatPrepared ? self.newRecord.category.icon : "repeat.circle.fill"
    }
    
    func reduceRange() {
        self.recurringRange = max(1, self.recurringRange - 1)
    }
    
    func increaseRange() {
        self.recurringRange += 1
    }
    
    func setupCategoryType() {
        if self.segemntedControlTag == 0, !self.recurringCatTapped {
            self.newRecord.categoryType = .generalExpense
        }
        if self.segemntedControlTag == 0, self.recurringCatTapped {
            self.newRecord.categoryType = .recurringExpense
        }
        if self.segemntedControlTag == 1, !self.recurringCatTapped {
            self.newRecord.categoryType = .oneTimeIncome
        }
        if self.segemntedControlTag == 1, self.recurringCatTapped {
            self.newRecord.categoryType = .regularIncome
        }
    }
    
    func setCategoryToDefault() {
        self.newRecord.category = Category(name: "", icon: "", color: .blue)
    }
}
