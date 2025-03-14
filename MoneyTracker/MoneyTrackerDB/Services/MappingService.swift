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
    
    static func mapDataToMoneyModel(recordsData: [Money]) -> [Record] {
        return recordsData.map { record in
            
            Record(managedObject: record)
        }
    }
}
