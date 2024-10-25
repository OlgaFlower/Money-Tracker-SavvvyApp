//
//  EditRecordViewModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 18.08.24.
//

import SwiftUI
import CoreData

final class EditRecordViewModel: ObservableObject {
    
    @ObservedObject private var dataService: DataService
    
    // MARK: - Publishers
    @Published var editingItem = MoneyModel() // TODO: - Handle error if id.isEmpty (record can't be found)
    @Published var inputAmount = ""
    
    // MARK: - Properties
    private var itemBeforeChanges = MoneyModel()
    
    // MARK: - Init
    init(
        dataService: DataService = DataService.shared,
        recordId: String
    ) {
        self.dataService = dataService
        self.loadRecord(recordId: recordId)
    }
    
    // MARK: - Functions
    func loadRecord(recordId: String) {
        guard let record = self.dataService.getRecordById(recordId: recordId) else { return }
        self.editingItem = record
        self.itemBeforeChanges = record
        self.inputAmount = record.moneyAmount.toString()
    }
    
    func saveChanges(using viewContext: NSManagedObjectContext) {
        
        if let editedMoneyAmount = Int64(self.inputAmount), 
            editedMoneyAmount != self.editingItem.moneyAmount {
            
            self.editingItem.moneyAmount = editedMoneyAmount
        }
        
        if self.editingItem != self.itemBeforeChanges {
            
            self.dataService.saveEditedRecord(
                id: self.editingItem.id,
                timestamp: self.editingItem.timestamp,
                moneyAmount: self.editingItem.moneyAmount,
                categoryName: self.editingItem.category.name,
                categoryIcon: self.editingItem.category.icon,
                notes: self.editingItem.notes,
                typeTag: self.editingItem.category.moneyGroupType.typeTag,
                using: viewContext
            )
        }
    }
    
    func vibrateMedium() {
        VibrateService.vibrateMedium()
    }
}
