//
//  MakeNewMoneyRecordViewModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 17.05.24.
//

import CoreData
import SwiftUI

final class MakeNewMoneyRecordViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var newItem = MoneyModel()
    @Published var inputAmount = ""
    @AppStorage("userCurrency") var currency: String = "EUR"
    
    init() {
        self.newItem.currency = self.currency
    }
    
    // MARK: - Functions
    func saveNewRecord(context: NSManagedObjectContext) {
        let moneyAmount = self.inputAmount.toInt64()
        
        if moneyAmount != 0,
           self.newItem.category.name != "CATEGORY" {
            
            CoreDataManager.shared.makeNewRecordWith(
                id: UUID().uuidString,
                moneyAmount: moneyAmount,
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
        DataService.shared.updateTodayMoneyValues()
    }
    
    func isCategoryChosen() -> Bool {
        self.newItem.category.name != "CATEGORY"
    }
    
    func checkCategoryFor(_ recordType: RecordType) {
        switch recordType {
        case .expense:
            if self.newItem.recordType != .expense {
                self.applyDefaultCategory()
            }
        case .income:
            if self.newItem.recordType != .income {
                self.applyDefaultCategory()
            }
        }
    }
    
    private func applyDefaultCategory() {
        self.newItem.category.name = "CATEGORY"
        self.newItem.category.icon = "sun.min"
    }
    
    func isSaveBtnActive() -> Bool {
        self.isCategoryChosen() && !self.inputAmount.isEmpty
    }
    
    func vibrateMedium() {
        VibrateService.vibrateMedium()
    }
    
    func vibrateLight() {
        VibrateService.vibrateLight()
    }
}
