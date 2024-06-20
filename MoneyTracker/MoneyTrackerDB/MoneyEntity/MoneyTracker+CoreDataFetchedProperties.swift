//
//  MoneyTracker+CoreDataFetchedProperties.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 19.06.24.
//

import Foundation

extension Money {
    
    var expensesRecords: [Money] {
        let records = self.value(forKey: "expensesRecords") as? [Money]
        return records ?? []
    }
    
    var incomeRecords: [Money] {
        let records = self.value(forKey: "incomeRecords") as? [Money]
        return records ?? []
    }
}
