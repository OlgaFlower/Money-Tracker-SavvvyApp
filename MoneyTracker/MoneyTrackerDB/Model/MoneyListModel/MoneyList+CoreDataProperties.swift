//
//  MoneyList+CoreDataProperties.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 08.06.24.
//
//

import Foundation
import CoreData

extension MoneyList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MoneyList> {
        return NSFetchRequest<MoneyList>(entityName: "MoneyList")
    }
    
    static func fetchOrCreateFor(recordDate: Date, in context: NSManagedObjectContext) -> MoneyList {
        
        let request: NSFetchRequest<MoneyList> = fetchRequest()
        let dateToTitle = String(DateFormatter.dayOnly.string(from: recordDate))
        let predicate = NSPredicate(format: "%K == %@", "title", dateToTitle)
        request.predicate = predicate
        
        do {
            let result = try context.fetch(request)
            
            if let list = result.first {
                return list
            } else {
                let list = MoneyList(context: context)
                list.title = dateToTitle ///  "11 Jun 2024"
                list.recordDate = recordDate
                return list
            }
        } catch {
            fatalError("Error fetching or creating list")
        }
    }

    @NSManaged public var title: String
    @NSManaged public var recordDate: Date
    @NSManaged public var records: [Money]

}

// MARK: Generated accessors for records
extension MoneyList {

    @objc(insertObject:inRecordsAtIndex:)
    @NSManaged public func insertIntoRecords(_ value: Money, at idx: Int)

    @objc(removeObjectFromRecordsAtIndex:)
    @NSManaged public func removeFromRecords(at idx: Int)

    @objc(insertRecords:atIndexes:)
    @NSManaged public func insertIntoRecords(_ values: [Money], at indexes: NSIndexSet)

    @objc(removeRecordsAtIndexes:)
    @NSManaged public func removeFromRecords(at indexes: NSIndexSet)

    @objc(replaceObjectInRecordsAtIndex:withObject:)
    @NSManaged public func replaceRecords(at idx: Int, with value: Money)

    @objc(replaceRecordsAtIndexes:withRecords:)
    @NSManaged public func replaceRecords(at indexes: NSIndexSet, with values: [Money])

    @objc(addRecordsObject:)
    @NSManaged public func addToRecords(_ value: Money)

    @objc(removeRecordsObject:)
    @NSManaged public func removeFromRecords(_ value: Money)

    @objc(addRecords:)
    @NSManaged public func addToRecords(_ values: NSOrderedSet)

    @objc(removeRecords:)
    @NSManaged public func removeFromRecords(_ values: NSOrderedSet)

}

extension MoneyList : Identifiable {

}
