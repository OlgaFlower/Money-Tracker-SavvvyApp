//
//  CategoriesView.swift
//  Monika
//
//  Created by Olha Bereziuk on 11.03.25.
//

import SwiftUI

struct CategoriesView: View {
    
    @Binding var record: Record
    @Binding var isSelected: Bool
    
    private var categoryGroup: CategoryGroup? {
        guard let recordCategory = CategoryType(rawValue: record.categoryType) else { return nil }
        return CategoryConstants.allCategories.first { $0.type == recordCategory }
    }
    
    var body: some View {
        if let categoryGroup = categoryGroup {
            CategoryList(
                categoryGroup: categoryGroup,
                onCategorySelected: { category in
                    self.record.category = category
                    self.isSelected.toggle()
                }
            )
        } else {
            Text("No categories available")
                .foregroundColor(.gray)
                .padding()
        }
    }
}

#Preview {
    CategoriesView(
        record: .constant(
            Record(
                categoryType: (CategoryType(rawValue: 0) ?? .generalExpense).rawValue,
                category: Category(
                    name: "Category name",
                    icon: "sun"
                ),
                note: "Some Note",
                moneyAmount: 17,
                timestamp: Date(),
                recurringUnit: "months",
                recurringRange: 5
            )
        ),
        isSelected: .constant(false)
    )
}
