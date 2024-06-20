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
    
}
