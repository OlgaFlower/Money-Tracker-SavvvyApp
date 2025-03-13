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
        return CategoryConstants.allCategories.first { $0.type == record.categoryType }
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
        record: .constant(Record()),
        isSelected: .constant(false)
    )
}
