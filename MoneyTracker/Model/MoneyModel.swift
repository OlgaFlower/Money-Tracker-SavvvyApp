//
//  MoneyModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 29.03.24.
//

import SwiftUI

struct MoneyModel: Identifiable {
    let id = UUID()
    let recordType: RecordType
    let icon: String
    let title: String
    let sum: String
    let description: String?
}

enum RecordType {
    case expenses
    case income
}
