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
    @Published var moneyAmount = ""
    
    // MARK: - Functions
    func saveNewRecord(context: NSManagedObjectContext) {
        if let intValue = Int64(self.moneyAmount),
           self.newItem.category.name != "CATEGORY" {
            
            CoreDataManager.makeNewRecordWith(
                id: UUID().uuidString,
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
    
    func refreshCalculations() {
        DataService.shared.updateTodayExpenses()
    }
    
    func isCategoryChosen() -> Bool {
        return self.newItem.category.name != "CATEGORY"
    }
    
    func isSaveBtnActive() -> Bool {
        return self.isCategoryChosen() && !self.moneyAmount.isEmpty
    }
    
    func vibrateMedium() {
        VibrateService.vibrateMedium()
    }
    
    func vibrateLight() {
        VibrateService.vibrateLight()
    }
}
