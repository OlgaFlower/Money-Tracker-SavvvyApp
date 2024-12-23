//
//  CalendarManager.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 06.06.24.
//

import Foundation

final class CalendarManager {
    
    static let shared = CalendarManager()
    
    private init() {}
    
    func weekdayAbbreviation() -> String {
        Date().formatted(.dateTime.weekday(.abbreviated))
    }
    
    func monthAndDay() -> String {
        Date().formatted(.dateTime.month(.wide).day())
    }
    
    func year() -> String {
        Date().formatted(.dateTime.year())
    }
    
    // OLD
    func getNumberOfDaysInMonth(for date: Date) -> Int {
        let calendar = Calendar.current

        let range = calendar.range(of: .day, in: .month, for: date)!
        let numDays = range.count

        return numDays
    }
}
