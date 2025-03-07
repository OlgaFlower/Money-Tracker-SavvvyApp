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
        self.inputAmount = String(record.moneyAmount)
    }
    
    func isSaveBtnActive() -> Bool {
        (self.inputAmount.toInt64() != self.editingItem.moneyAmount) || self.hasItemChanged()
    }
    
    func saveChanges(using viewContext: NSManagedObjectContext) {
        self.updateMoneyAmountIfChanged(self.inputAmount.toInt64())
        
        if self.hasItemChanged() {
            self.saveEditedRecord(using: viewContext)
        }
    }
    
    private func saveEditedRecord(using viewContext: NSManagedObjectContext) {
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
    
    private func updateMoneyAmountIfChanged(_ editedAmount: Int64) {
        if editedAmount != self.editingItem.moneyAmount {
            self.editingItem.moneyAmount = editedAmount
        }
    }
    
    private func hasItemChanged() -> Bool {
        self.editingItem != self.itemBeforeChanges
    }
    
    func vibrateMedium() {
        VibrateService.vibrateMedium()
    }
}
