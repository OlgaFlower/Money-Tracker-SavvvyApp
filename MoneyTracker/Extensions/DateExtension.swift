//
//  DateExtension.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 11.06.24.
//

import Foundation

extension DateFormatter {
    
    static let dayOnly: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter ///  "11 Jun 2024"
    }()
}
