//
//  NewRecordViewModel.swift
//  Monika
//
//  Created by Olha Bereziuk on 23.12.24.
//

import Foundation

struct Record {
    var id: UUID = UUID()
    var categoryType: CategoryType = .expense
    var category = Category(
        name: "",
        icon: "",
        color: .blue
    )
    var description: String = ""
}

final class NewRecordViewModel: ObservableObject {
    
    @Published var newRecord = Record()
    @Published var inputAmount = ""
    @Published var currencySign = UserPreferences.currencySign
    
    @Published var recurringRange: Int = 1
    @Published var preselectedTag: Int = 0 // Segmented control
    
    let controlOptions = ["Expense", "Income"]
    
    var regularCatSelected: Bool {
        (self.newRecord.categoryType == .expense || self.newRecord.categoryType == .oneTimeIncome)
                && !self.newRecord.category.name.isEmpty
    }
    
    var recurringCatSelected: Bool {
        (self.newRecord.categoryType == .recurringExpense || self.newRecord.categoryType == .regularIncome)
                && !self.newRecord.category.name.isEmpty
    }
    
    var regularCatTitle: String {
        self.regularCatSelected ? self.newRecord.category.name : "Regular"
    }
    
    var regularCatIcon: String {
        self.regularCatSelected ? self.newRecord.category.icon : "cart.circle.fill"
    }
    
    var recurringCatTitle: String {
        self.recurringCatSelected ? self.newRecord.category.name : "Recurring"
    }
    
    var recurringCatIcon: String {
        self.recurringCatSelected ? self.newRecord.category.icon : "repeat.circle.fill"
    }
    
    func reduceRange() {
        self.recurringRange = max(1, self.recurringRange - 1)
    }
    
    func increaseRange() {
        self.recurringRange += 1
    }
    
    func setCategoryToDefault() {
        self.newRecord.category = Category(name: "", icon: "", color: .blue)
    }
}
