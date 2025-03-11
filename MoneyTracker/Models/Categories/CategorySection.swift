//
//  CategorySection.swift
//  Monika
//
//  Created by Olha Bereziuk on 11.03.25.
//

import Foundation

// Section for Recurring Expenses
struct CategorySection: Identifiable {
    let id = UUID()
    let title: String
    let categories: [Category]
}
