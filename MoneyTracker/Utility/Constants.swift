//
//  Constants.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 22.04.24.
//

import SwiftUI

final class Constants {
    
    static let screenWidth: CGFloat = UIScreen.main.bounds.width
    
    private init() {}
    
    // MARK: - Currency TextField -
    static let decimalSeparator = Locale.current.decimalSeparator ?? "."
    static let groupingSeparator = Locale.current.groupingSeparator ?? ","
    
    // MARK: - DropDown Menu -
    /// Add new record
    static let newRecordTypes = [RecordType.expense, RecordType.income]
    
    static let gradientForIcon: [Color] = [.gradientBottom3, .lightBlue]
        
}
