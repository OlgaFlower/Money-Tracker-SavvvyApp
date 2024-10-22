//
//  EditRecordViewModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 18.08.24.
//

import SwiftUI

final class EditRecordViewModel: ObservableObject {
    
    @ObservedObject private var dataService: DataService
    
    // MARK: - Publishers
    @Published var editingItem = MoneyModel() // TODO: - Handle error if id.isEmpty (record can't be found)
    @Published var inputAmount = ""
    
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
        self.inputAmount = record.moneyAmount.toString()
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
