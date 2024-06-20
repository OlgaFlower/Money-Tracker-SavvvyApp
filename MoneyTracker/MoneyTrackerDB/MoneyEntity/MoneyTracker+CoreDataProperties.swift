//
//  MoneyTracker+CoreDataProperties.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 16.05.24.
//

import CoreData
import SwiftUI

extension Money {
    
    // MARK: - Properties
    @NSManaged public var categoryIcon: String
    @NSManaged public var categoryName: String
    @NSManaged public var currency: String
    @NSManaged public var timestamp: Date
    @NSManaged public var isIncome: Bool
    @NSManaged public var moneyAmount: Int64
    @NSManaged public var notes: String?
    @NSManaged public var typeTag: Int16
}
