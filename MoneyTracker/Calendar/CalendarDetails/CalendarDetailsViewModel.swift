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
        self.income = records.filter { record in
            record.isIncome
        }.map({ record in
            MoneyModel(
                recordType: .income,
                category: Category(
                    moneyGroupType: self.tagToGroupType(tag: record.typeTag),
                    name: record.categoryName,
                    icon: record.categoryIcon
                ),
                moneyAmount: record.moneyAmount.toString(),
                notes: record.notes ?? "",
                currency: record.currency,
                timestamp: record.timestamp
            )
        })
        
        print("INCOME: \(income)")
    }
    
    func getExpensesRecords(records: FetchedResults<Money>) {
        self.expenses = records.filter { record in
            !record.isIncome
        }.map({ record in
            MoneyModel(
                recordType: .expense,
                category: Category(
                    moneyGroupType: self.tagToGroupType(tag: record.typeTag),
                    name: record.categoryName,
                    icon: record.categoryIcon
                ),
                moneyAmount: record.moneyAmount.toString(),
                notes: record.notes ?? "",
                currency: record.currency,
                timestamp: record.timestamp
            )
        })
        print("EXPENSES: \(expenses)")
    }
    
    func tagToGroupType(tag: Int16) -> MoneyGroupType {
        switch tag {
        case 1: return MoneyGroupType.regularIncome
        case 2: return MoneyGroupType.temporaryIncome
        case 3: return MoneyGroupType.generalExpense
        case 4: return MoneyGroupType.recurringExpense
        default: return MoneyGroupType.none
        }
    }
}
