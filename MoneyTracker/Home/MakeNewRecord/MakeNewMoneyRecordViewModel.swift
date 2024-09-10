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
    @Published var newItem = MoneyModel()
    
    // MARK: - Functions
    func saveNewRecord(context: NSManagedObjectContext) {
        if let intValue = Int64(self.newItem.moneyAmount),
           self.newItem.category.name != "CATEGORY" {
            
            CoreDataManager.makeNewRecordWith(
                id: self.newItem.id,
                moneyAmount: intValue,
                currency: self.newItem.currency,
                isIncome: self.newItem.recordType == .income ? true : false,
                categoryName: self.newItem.category.name,
                categoryIcon: self.newItem.category.icon,
                timestamp: Date(),
                notes: self.newItem.notes, 
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
    
    func vibrateMedium() {
        Constants.vibrateMedium()
    }
    
    func vibrateLight() {
        Constants.vibrateLight()
    }
}
