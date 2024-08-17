//
//  Int16+MoneyGroupTypeTags.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 17.08.24.
//

import Foundation

extension Int16 {
    
    func tagToGroupType() -> MoneyGroupType {
            let tagMapping: [Int16: MoneyGroupType] = [
                1: .regularIncome,
                2: .temporaryIncome,
                3: .generalExpense,
                4: .recurringExpense
            ]
            
            return tagMapping[self] ?? .none
        }
}
