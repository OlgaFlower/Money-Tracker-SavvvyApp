//
//  MakeNewMoneyRecordViewModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 17.05.24.
//

import CoreData
import Foundation

final class MakeNewMoneyRecordViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var newItem: MoneyModel = MoneyModel(
        recordType: .expense,
        category: Category(
            moneyGroupType: .none,
            name: "",
            icon: ""
        ),
        moneyAmount: "",
        description: "",
        currency: ""
    )
    
    // MARK: - Init
    init() {
        self.setDefaultValues()
    }
    
    // MARK: - Functions
    func setDefaultValues() {
        self.newItem.category.moneyGroupType = .none
        self.newItem.category.name = "CATEGORY"
        self.newItem.category.icon = "sun.min"
        self.newItem.currency = "EUR"
    }
    
    func saveNewRecord(context: NSManagedObjectContext) {
        if let intValue = Int64(self.newItem.moneyAmount),
           self.newItem.category.name != "CATEGORY" {
            
            Money.makeNewRecordWith(
                moneyAmount: intValue,
                currency: self.newItem.currency,
                isIncome: self.newItem.recordType == .income ? true : false,
                categoryName: self.newItem.category.name,
                categoryIcon: self.newItem.category.icon,
                timestamp: Date(),
                notes: self.newItem.description, 
                typeTag: self.newItem.category.moneyGroupType.typeTag, 
                using: context
            )
        }
    }
    
    func isCategoryChosen() -> Bool {
        return self.newItem.category.name != "CATEGORY"
    }
    
    func isSaveBtnActive() -> Bool {
        return self.isCategoryChosen() && !self.newItem.moneyAmount.isEmpty
    }
    
    func shortVibrate() {
        Constants.vibrateMedium()
    }
}
