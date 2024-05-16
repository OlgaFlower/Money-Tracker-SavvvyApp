//
//  Constants.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 22.04.24.
//

import SwiftUI

final class Constants {
    
    private init() {}
    
    // MARK: - Screen Width -
    static let screenWidth: CGFloat = UIScreen.main.bounds.width
    
    // MARK: - Currency TextField -
    static let decimalSeparator = Locale.current.decimalSeparator ?? "."
    static let groupingSeparator = Locale.current.groupingSeparator ?? ","
    
    // MARK: - DropDown Menu -
    /// Add new record
    static let newRecordTypes = [RecordType.expense, RecordType.income]
    static let gradientForIcon: [Color] = [.gradientBottom3, .lightBlue]
    
    // MARK: - Make Vibration -
    static func vibrate() {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }
}
