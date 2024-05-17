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
    @NSManaged public var date: Date
    @NSManaged public var isIncome: Bool
    @NSManaged public var moneyAmount: Int64
    @NSManaged public var notes: String?
    
    // MARK: - Functions -
    /// Make New Record
    static func makeNewRecordWith(
        moneyAmount: Int64,
        currency: String,
        isIncome: Bool,
        categoryName: String,
        categoryIcon: String,
        date: Date,
        notes: String?,
        using managedObjectContext: NSManagedObjectContext
    ) {
        let newRecord = Money(context: managedObjectContext)
        newRecord.date = Date()
        newRecord.categoryIcon = categoryIcon
        newRecord.categoryName = categoryName
        newRecord.currency = currency
        newRecord.isIncome = isIncome
        newRecord.moneyAmount = moneyAmount
        newRecord.notes = notes
        
        do {
            try managedObjectContext.save()
        } catch {
            // TODO: - let user know that smth went wrong during saving data
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    /// Fetch Data
    static func basicFetchRequest() -> FetchRequest<Money> {
        FetchRequest(entity: Money.entity(), sortDescriptors: [])
    }
    
    // MARK: - TODO: Delete this func after all, it's for testing! -
    /// Delete ALL objects
    static func deleteAllObjects() {
        @Environment(\.managedObjectContext) var viewContext
        
        let persistentStoreCoordinator = viewContext.persistentStoreCoordinator
        let entities = persistentStoreCoordinator?.managedObjectModel.entities
        
        entities?.forEach { entity in
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity.name!)
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            
            do {
                try viewContext.execute(batchDeleteRequest)
                try viewContext.save()
                print("ALL objects DELETED!")
            } catch {
                print("Failed to delete objects for entity \(entity.name!): \(error)")
            }
        }
    }
}
