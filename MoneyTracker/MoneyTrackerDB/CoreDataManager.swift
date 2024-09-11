//
//  CoreDataManager.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 18.06.24.
//

import CoreData 
import SwiftUI

final class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private init() {}
    
    ///  Record by its ID
    static func fetchRecord(withID id: String) -> NSPredicate {
        return NSPredicate(format: "id == %@", id)
    }
    
    /// All Records for DATE
    static func predicateForSelectedDay(date: Date) -> NSPredicate {
        return NSPredicate(
                    format: "timestamp >= %@ AND timestamp < %@",
                    Calendar.current.startOfDay(for: date) as NSDate,
                    Calendar.current.date(byAdding: .day, value: 1, to: Calendar.current.startOfDay(for: date))! as NSDate
                )
    }
    
    /// Expenses for DATE
    static func fetchExpensesForDay(date: Date) -> FetchRequest<Money> {
        let timestampSortDescriptor = NSSortDescriptor(keyPath: \Money.timestamp , ascending: true)
        let predicate = NSPredicate(
            format: "timestamp >= %@ AND timestamp < %@ AND isIncome == %d",
            Calendar.current.startOfDay(for: Date()) as NSDate,
            Calendar.current.date(byAdding: .day, value: 1, to: Calendar.current.startOfDay(for: Date()))! as NSDate,
        false
        )
        
        return FetchRequest<Money>(
            entity: Money.entity(),
            sortDescriptors: [timestampSortDescriptor],
            predicate: predicate
        )
    }
    
    /// TODAY Records
    static func fetchTodayRecords() -> FetchRequest<Money> {
        let timestampSortDescriptor = NSSortDescriptor(keyPath: \Money.timestamp , ascending: true)
        
        let timestampPredicate = NSPredicate(format: "timestamp >= %@ AND timestamp < %@", Calendar.current.startOfDay(for: Date()) as NSDate, Calendar.current.date(byAdding: .day, value: 1, to: Calendar.current.startOfDay(for: Date()))! as NSDate)
        
        return FetchRequest<Money>(
            entity: Money.entity(),
            sortDescriptors: [timestampSortDescriptor],
            predicate: timestampPredicate
        )
    }
    
    /// CURRENT MONTH Records
    static func fetchCurrentMonthRecords() -> FetchRequest<Money> {
        let calendar = Calendar.current
        let currentDate = Date()
        
        // Get the start of the current month
        guard let startOfMonth = calendar.date(
            from: calendar.dateComponents([.year, .month], from: currentDate)
        ) else {
            fatalError("Could not determine start of the current month.")
        }
        
        // Get the start of the next month (which effectively is the end of the current month)
        guard let startOfNextMonth = calendar.date(
            byAdding: .month, value: 1, to: startOfMonth
        ) else {
            fatalError("Could not determine start of the next month.")
        }
        
        // Create a predicate to filter records between the start and end of the current month
        let timestampPredicate = NSPredicate(format: "timestamp >= %@ AND timestamp < %@", startOfMonth as NSDate, startOfNextMonth as NSDate)
        let timestampSortDescriptor = NSSortDescriptor(keyPath: \Money.timestamp, ascending: true)
        
        return FetchRequest<Money>(
            entity: Money.entity(),
            sortDescriptors: [timestampSortDescriptor],
            predicate: timestampPredicate
        )
    }
    
    /// Make NEW RECORD
    static func makeNewRecordWith(
        id: String,
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
        newRecord.id = id
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
    
    /// DELETE ALL objects
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
