//
//  ExpensesDetailViewModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 25.06.24.
//

import SwiftUI

final class ExpensesDetailViewModel: ObservableObject {
    
    @Published var generalExpenses: [MoneyModel] = []
    @Published var recurringExpenses: [MoneyModel] = []
    
    func loadExpenses(records: FetchedResults<Money>) {
        self.generalExpenses = filterAndMap(records: records, forTag: 3)
        self.recurringExpenses = filterAndMap(records: records, forTag: 4)
    }
    
    private func filterAndMap(records: FetchedResults<Money>, forTag tag: Int16) -> [MoneyModel] {
        return records.filter { $0.typeTag == tag }.map { record in
            
            return MoneyModel(
                id: record.id,
                recordType: .expense,
                category: Category(
                    moneyGroupType: record.typeTag.tagToGroupType(),
                    name: record.categoryName,
                    icon: record.categoryIcon
                ),
                moneyAmount: record.moneyAmount.toString(),
                notes: record.notes ?? "",
                currency: record.currency,
                timestamp: record.timestamp
            )
        }
    }
}
