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
    
    // MARK: - Records by Date
    func fetchRecords(for date: Date) -> [MoneyModel] {
        let request = NSFetchRequest<Money>(entityName: "Money")
        request.predicate = NSPredicate(
            format: "timestamp >= %@ AND timestamp < %@",
            Calendar.current.startOfDay(for: date) as NSDate,
            Calendar.current.date(
                byAdding: .day,
                value: 1,
                to: Calendar.current.startOfDay(for: date)
            )! as NSDate
        )
        do {
            let result = try PersistenceController.shared.container.viewContext.fetch(request)
            if !result.isEmpty {
                let records = MappingService.mapDataToMoneyModel(recordsData: result)
                return records
            }
        } catch let error {
            print("Error fetching a record by Id. \(error)")
        }
        return []
    }
    
    // MARK: - Record by ID
    func fetchRecordById(recordId: String) -> MoneyModel? {
        let request = NSFetchRequest<Money>(entityName: "Money")
        request.predicate = NSPredicate(format: "id == %@", recordId)
        
        do {
            let result = try PersistenceController.shared.container.viewContext.fetch(request)
            if !result.isEmpty {
                let record = MappingService.mapDataToMoneyModel(recordsData: result)
                return record.first
            }
        } catch let error {
            print("Error fetching a record by Id. \(error)")
        }
        return nil
    }
    
    // MARK: - Expenses for Day
    func fetchExpensesForDay(date: Date) -> [MoneyModel] {
        let request = NSFetchRequest<Money>(entityName: "Money")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Money.timestamp , ascending: true)]
        request.predicate = NSPredicate(
            format: "timestamp >= %@ AND timestamp < %@ AND isIncome == %d",
            Calendar.current.startOfDay(for: Date()) as NSDate,
            Calendar.current.date(byAdding: .day, value: 1, to: Calendar.current.startOfDay(for: Date()))! as NSDate,
            false
        )
        do {
            let result = try PersistenceController.shared.container.viewContext.fetch(request)
            return MappingService.mapDataToMoneyModel(recordsData: result)
        } catch let error {
            print("Error ExpensesForDay fetching. \(error)")
        }
        return []
    }
    
    // MARK: - Month Income
    func fetchMonthIncomeRecords(for month: Int, year: Int) -> [MoneyModel] {
        let calendar = Calendar.current
        
        // Create date components for the specified month and year
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        
        // Get the start of the specified month
        guard let startOfMonth = calendar.date(from: dateComponents) else {
            fatalError("Could not determine start of the specified month.")
        }
        
        // Get the start of the next month
        guard let startOfNextMonth = calendar.date(byAdding: .month, value: 1, to: startOfMonth) else {
            fatalError("Could not determine start of the next month.")
        }
        
        let request = NSFetchRequest<Money>(entityName: "Money")
        
        let timestampPredicate = NSPredicate(format: "timestamp >= %@ AND timestamp < %@", startOfMonth as NSDate, startOfNextMonth as NSDate)
        let isIncomePredicate = NSPredicate(format: "isIncome == %d", true)
        let combinedPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [timestampPredicate, isIncomePredicate])
        request.predicate = combinedPredicate
        
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Money.timestamp, ascending: true)]
        
        do {
            let result = try PersistenceController.shared.container.viewContext.fetch(request)
            return MappingService.mapDataToMoneyModel(recordsData: result)
        } catch let error {
            print("Error MonthIncomeRecords fetching. \(error)")
        }
        return []
    }
    
    // MARK: - Delete Record by ID
    func deleteRecord(
        recordId: String,
        in viewContext: NSManagedObjectContext
    ) {
        let request = NSFetchRequest<Money>(entityName: "Money")
        request.predicate = NSPredicate(format: "id == %@", recordId)
        
        do {
            let results = try viewContext.fetch(request)
            
            if let itemObject = results.first {
                viewContext.delete(itemObject)
            }
        } catch {
            print("Error fetching object to delete: \(error)")
        }
        
        do {
            try viewContext.save()
        } catch {
            print("Error saving context after deletion: \(error)")
        }
    }
    
    //MARK: - Make NEW RECORD
    func makeNewRecordWith(
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
        
        let request = NSFetchRequest<Money>(entityName: "Money")
        request.predicate = NSPredicate(format: "id == %@", id)
        
        do {
            let results = try managedObjectContext.fetch(request)
            
            if let existingRecord = results.first {
                
                existingRecord.timestamp = timestamp
                existingRecord.categoryIcon = categoryIcon
                existingRecord.categoryName = categoryName
                existingRecord.moneyAmount = moneyAmount
                existingRecord.notes = notes
                existingRecord.typeTag = typeTag
            }
            else {
                
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
            }
            
            try managedObjectContext.save()
            
        } catch {
            // TODO: - let user know that smth went wrong during saving data
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    //MARK: - DELETE ALL
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
    
    
    
    
    
    // ==================================================
    
    
    
    
    
    ///  Record by its ID
    // TODO: - Remove this
    static func fetchRecord(withID id: String) -> NSPredicate {
        return NSPredicate(format: "id == %@", id)
    }
    
    /// All Records for DATE
    // TODO: - Remove this
    static func predicateForSelectedDay(date: Date) -> NSPredicate {
        return NSPredicate(
            format: "timestamp >= %@ AND timestamp < %@",
            Calendar.current.startOfDay(for: date) as NSDate,
            Calendar.current.date(byAdding: .day, value: 1, to: Calendar.current.startOfDay(for: date))! as NSDate
        )
    }
    
    
    // TODO: - Check and remove these old functios
    
    func deleteRecord(
        at offsets: IndexSet,
        from records: inout [MoneyModel],
        in viewContext: NSManagedObjectContext
    ) {
        for index in offsets {
            let recordToDelete = records[index]
            
            // Create a fetch request to find the Money object by id
            let fetchRequest: NSFetchRequest<Money> = Money.fetchRequest() as! NSFetchRequest<Money>
            fetchRequest.predicate = NSPredicate(format: "id == %@", recordToDelete.id as CVarArg)
            
            do {
                // Execute the fetch request
                let results = try viewContext.fetch(fetchRequest)
                
                // If the object is found, delete it
                if let objectToDelete = results.first {
                    viewContext.delete(objectToDelete)
                }
            } catch {
                print("Error fetching object to delete: \(error)")
            }
        }
        // TODO: - take away removing from local array to the viewmodel/view
        // Remove from the local array
        records.remove(atOffsets: offsets)
        // Save the context
        do {
            try viewContext.save()
        } catch {
            print("Error saving context after deletion: \(error)")
        }
    }
    
}
