//
//  CategoryList.swift
//  Monika
//
//  Created by Olha Bereziuk on 11.03.25.
//

import SwiftUI

struct CategoryList: View {
    
    let categoryGroup: CategoryGroup
    let onCategorySelected: (Category) -> Void
    
    var body: some View {
        List {
            // If sections exist (for Recurring Expenses), show them
            if let sections = categoryGroup.sections {
                
                ForEach(sections) { section in
                    Section(header: Text(section.title)) {
                        
                        ForEach(section.categories) { category in
                            CategoryRow(category: category) {
                                onCategorySelected(category)
                            }
                        }
                    }
                }
            } else {
                // Otherwise, show a plain list (for Expenses, Regular Income, One-time Income)
                ForEach(categoryGroup.subcategories) { category in
                    CategoryRow(category: category) {
                        onCategorySelected(category)
                    }
                }
            }
        }
    }
}

#Preview {
    CategoryList(categoryGroup: CategoryGroup(
        type: .recurringExpense,
        sections: [
            CategorySection(title: "Housing", categories: [
                Category(name: "Rent", icon: "house.fill"),
                Category(name: "Mortgage", icon: "building.fill")
            ]),
            CategorySection(title: "Tech", categories: [
                Category(name: "Cell Phone", icon: "phone.fill"),
                Category(name: "Apple One", icon: "applelogo")
            ])
        ],
        subcategories: []
    ), onCategorySelected: {_ in })
}
