//
//  Category.swift
//  Monika
//
//  Created by Olha Bereziuk on 11.03.25.
//

import SwiftUI

struct Category: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let icon: String
    
    static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.icon == rhs.icon
    }
}
