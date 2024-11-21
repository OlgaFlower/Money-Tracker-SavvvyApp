//
//  PickerItem.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 21.11.24.
//

import Foundation

protocol PickerItem: Identifiable, CaseIterable {
    var id: String { get }
    var rawValue: String { get }
}
