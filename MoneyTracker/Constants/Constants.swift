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
    
    // MARK: - DropDown Menu -
    /// Add new record
    static let newRecordTypes = [RecordType.expense, RecordType.income]
    
    // MARK: - Alert texts -
    static let budgetTextExplanation = "The daily budget consists of all revenues deposited in the current month and, if available, the positive balance from the previous month."
    
}
