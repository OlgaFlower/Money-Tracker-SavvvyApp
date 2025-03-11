//
//  MappingService.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 28.09.24.
//

import Foundation

final class MappingService {
    
    static let shared = MappingService()
    
    private init() {}
    
    static func mapDataToMoneyModel(recordsData: [Money]) -> [MoneyModel] {
        return recordsData.map { record in
            MoneyModel(
                id: record.id,
                recordType: record.isIncome ? .income : .expense,
                category: Category_old(
                    moneyGroupType: record.typeTag.tagToGroupType(),
                    name: record.categoryName,
                    icon: record.categoryIcon
                ),
                moneyAmount: record.moneyAmount,
                notes: record.notes ?? "",
                currency: record.currency,
                timestamp: record.timestamp,
                typeTag: Int(record.typeTag)
            )
        }
    }
}
