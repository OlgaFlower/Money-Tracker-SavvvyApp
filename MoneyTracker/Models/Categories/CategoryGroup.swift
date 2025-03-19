//
//  CategoryGroup.swift
//  Monika
//
//  Created by Olha Bereziuk on 11.03.25.
//

import Foundation

// Main Category with Subcategories
struct CategoryGroup {
    let type: CategoryType
    let sections: [CategorySection]?
    let subcategories: [Category]
}
