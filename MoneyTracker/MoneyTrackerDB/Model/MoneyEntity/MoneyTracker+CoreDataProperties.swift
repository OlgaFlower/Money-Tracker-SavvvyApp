//
//  MoneyTracker+CoreDataProperties.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 16.05.24.
//

import CoreData
import SwiftUI

extension Money {
    
    // MARK: - Properties -
    @NSManaged public var categoryIcon: String
    @NSManaged public var categoryName: String
    @NSManaged public var currency: String
    @NSManaged public var timestamp: Date
    @NSManaged public var isIncome: Bool
    @NSManaged public var moneyAmount: Int64
    @NSManaged public var notes: String?
    @NSManaged public var typeTag: Int16
    
    
    // MARK: - Functions -
    /// Make New Record
    static func makeNewRecordWith(
        moneyAmount: Int64,
        currency: String,
        isIncome: Bool,
        categoryName: String,
        categoryIcon: String,
        timestamp: Date,
        notes: String?,
        typeTag: Int16,
        using managedObjectContext: NSManagedObjectContext
    ) {
        let newRecord = Money(context: managedObjectContext)
        newRecord.timestamp = timestamp
        newRecord.categoryIcon = categoryIcon
        newRecord.categoryName = categoryName
        newRecord.currency = currency
        newRecord.isIncome = isIncome
        newRecord.moneyAmount = moneyAmount
        newRecord.notes = notes
        newRecord.typeTag = typeTag
        do {
            try managedObjectContext.save()
        } catch {
            // TODO: - let user know that smth went wrong during saving data
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    /// Fetch ALL Money records
    static func basicFetchRequest() -> FetchRequest<Money> {
        FetchRequest(entity: Money.entity(), sortDescriptors: [])
    }
    
    
    
    
    
    // MARK: - TODO: Delete this func after all, it's for testing! -
    /// Delete ALL objects
    static func deleteAllObjects(context: NSManagedObjectContext) {
        let persistentStoreCoordinator = context.persistentStoreCoordinator
        let entities = persistentStoreCoordinator?.managedObjectModel.entities
        
        entities?.forEach { entity in
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity.name!)
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            
            do {
                try context.execute(batchDeleteRequest)
                try context.save()
                print("ALL objects DELETED!")
            } catch {
                print("Failed to delete objects for entity \(entity.name!): \(error)")
            }
        }
    }
}
