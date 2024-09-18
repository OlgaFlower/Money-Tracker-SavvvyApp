//
//  EditRecordViewModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 18.08.24.
//

import SwiftUI

final class EditRecordViewModel: ObservableObject {
    
    @Published var editingItem = MoneyModel()
    
    func loadRecord(records: FetchedResults<Money>) {
        guard let record = records.first else { return }
        
        self.editingItem = MoneyModel(
            id: record.id,
            recordType: record.isIncome ? .income : .expense,
            category: self.createCategory(from: record),
            moneyAmount: record.moneyAmount.toString(),
            notes: record.notes ?? "",
            currency: record.currency,
            timestamp: record.timestamp
        )
    }
    
    private func createCategory(from record: Money) -> Category {
            return Category(
                moneyGroupType: record.typeTag.tagToGroupType(),
                name: record.categoryName,
                icon: record.categoryIcon
            )
        }
    
    func vibrateMedium() {
        VibrateService.vibrateMedium()
    }
}
