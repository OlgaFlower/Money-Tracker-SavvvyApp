//
//  Language.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 01.12.24.
//

import Foundation

enum Language: String, CaseIterable, Identifiable {
    
    case english = "English"
    case ukrainian = "Ukrainian"
    case german = "German"
    
    var id: String {
        self.rawValue
    }
}

// MARK: - Extension
extension Language: PickerItem {}
