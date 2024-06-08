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
    
    static func create(for date: Date, in context: NSManagedObjectContext) {
        let newRecordsList = self.init(context: context)
        newRecordsList.date = date
        
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolves error of newRecordsList saving: \(nserror), \(nserror.userInfo)")
        }
    }

    @NSManaged public var date: Date?
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
