//
//  Date+Extension.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 11.06.24.
//

import Foundation

extension Date {
    
    /// Full Month Name and Year
    func formattedMonthYear() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: self)
    }
    
    static var firstDayOfWeek = Calendar.current.firstWeekday
    
    /// Uppercased Week Days
    static var uppercasedWeekdays: [String] {
        let calendar = Calendar.current
        /// Adjusted for the different weekday starts
        var weekdays = calendar.shortWeekdaySymbols
        if firstDayOfWeek > 1 {
            for _ in 1..<firstDayOfWeek {
                if let first = weekdays.first {
                    weekdays.append(first)
                    weekdays.removeFirst()
                }
            }
        }
        return weekdays.map { $0.uppercased() }
    }
    
    var startOfMonth: Date {
        Calendar.current.dateInterval(of: .month, for: self)!.start
    }
    
    var endOfMonth: Date {
        let lastDay = Calendar.current.dateInterval(of: .month, for: self)!.end
        return Calendar.current.date(byAdding: .day, value: -1, to: lastDay)!
    }
    
    var numberOfDaysInMonth: Int {
        Calendar.current.component(.day, from: endOfMonth)
    }
    
    var firstWeekDayBeforeStart: Date {
        let startOfMonthWeekday = Calendar.current.component(.weekday, from: startOfMonth)
        var numberFromPreviousMonth = startOfMonthWeekday - Self.firstDayOfWeek
        if numberFromPreviousMonth < 0 {
            ///Adjust to a 0-6 range if negative
            numberFromPreviousMonth += 7
        }
        return Calendar.current.date(byAdding: .day, value: -numberFromPreviousMonth, to: startOfMonth)!
    }
    
    /// Calendar Display Days
    var calendarDisplayDays: [Date] {
       var days: [Date] = []
       /// Start with days from the previous month to fill the grid
       let firstDisplayDay = firstWeekDayBeforeStart
       var day = firstDisplayDay
       while day < startOfMonth {
           days.append(day)
           day = Calendar.current.date(byAdding: .day, value: 1, to: day)!
       }
       /// Add days of the current month
       for dayOffset in 0..<numberOfDaysInMonth {
           let newDay = Calendar.current.date(byAdding: .day, value: dayOffset, to: startOfMonth)
           days.append(newDay!)
       }
       return days
    }
    
    var monthInt: Int {
        Calendar.current.component(.month, from: self)
    }
    
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
}
