//
//  ExpensesDetailViewModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 25.06.24.
//

import SwiftUI

final class ExpensesDetailViewModel: ObservableObject {
    
    @Published var expenses: [MoneyModel] = []
    
    func getExpenses(records: FetchedResults<Money>) {
        
        self.expenses = records.map({ record in
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
    }
    
    func tagToGroupType(tag: Int16) -> MoneyGroupType {
        switch tag {
        case 3: return MoneyGroupType.generalExpense
        case 4: return MoneyGroupType.recurringExpense
        default: return MoneyGroupType.none
        }
    }
}
