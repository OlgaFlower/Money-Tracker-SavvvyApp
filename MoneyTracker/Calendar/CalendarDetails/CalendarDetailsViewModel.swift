//
//  CalendarDetailsViewModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 07.08.24.
//

import SwiftUI

final class CalendarDetailsViewModel: ObservableObject {
    
    @Published var expenses: [MoneyModel] = []
    @Published var income: [MoneyModel] = []
    
    func getIncomeRecords(records: FetchedResults<Money>) {
        
        self.income = self.filterAndMapRecords(
            records: records,
            isIncome: true
        )
    }
    
    func getExpensesRecords(records: FetchedResults<Money>) {
        
        self.expenses = self.filterAndMapRecords(
            records: records,
            isIncome: false
        )
    }
    
    private func filterAndMapRecords(
        records: FetchedResults<Money>,
        isIncome: Bool
    ) -> [MoneyModel] {
        
           return records.filter { $0.isIncome == isIncome }.map { record in
               MoneyModel(
                   recordType: isIncome ? .income : .expense,
                   category: self.createCategory(from: record),
                   moneyAmount: record.moneyAmount.toString(),
                   notes: record.notes ?? "",
                   currency: record.currency,
                   timestamp: record.timestamp
               )
           }
       }
    
    private func createCategory(from record: Money) -> Category {
        
            return Category(
                moneyGroupType: tagToGroupType(tag: record.typeTag),
                name: record.categoryName,
                icon: record.categoryIcon
            )
        }
    
    private func tagToGroupType(tag: Int16) -> MoneyGroupType {
        
        switch tag {
        case 1: return MoneyGroupType.regularIncome
        case 2: return MoneyGroupType.temporaryIncome
        case 3: return MoneyGroupType.generalExpense
        case 4: return MoneyGroupType.recurringExpense
        default: return MoneyGroupType.none
        }
    }
}
