//
//  Language.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 01.12.24.
//

import Foundation

enum Language: String {
    
    case english = "English"
    case ukrainian = "Українська"
    case german = "Deutsch"
    
    var id: String {
        self.rawValue
    }
}

// MARK: - Extension
extension Language: PickerItem {}
