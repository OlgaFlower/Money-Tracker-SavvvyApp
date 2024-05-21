//
//  CategoriesGridView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 20.05.24.
//

import SwiftUI

struct CategoriesGridView: View {
    
    // MARK: - Environment -
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Properties
    private let fixedColumn = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]
    
    let categories: MoneyCategories
    
    // MARK: - State -
    @Binding var selectedCategory: Category
    
    // MARK: - Body -
    var body: some View {
        LazyVGrid(columns: self.fixedColumn, spacing: 30) {
            ForEach(self.categories.categoryItems, id: \.self) { item in
                self.makeIconsGridView(item: item)
            }
        }
    }
    
    // MARK: - Functions -
    private func makeIconsGridView(item: Category) -> some View {
        VStack {
            Image(systemName: item.icon)
                .frame(width: 80, height: 80, alignment: .center)
                .background(.blue)
                .cornerRadius(10)
            
            Text(item.name)
        }
        .frame(width: 100, height: 100)
        .foregroundStyle(.white)
        .onTapGesture {
            self.selectedCategory = item
            self.dismiss()
        }
    }
}

// MARK: - Preview -
#Preview {
    CategoriesGridView(
        categories: MoneyCategories(
            categoryItems: [
                Category(
                    moneyGroupType: .generalExpense,
                    name: "Salary",
                    icon: "sun.max"
                )
            ]
        ),
        selectedCategory: .constant(
            Category(
                moneyGroupType: .regularIncome, 
                name: "Pension",
                icon: "sun.horizon"
            )
        )
    )
}
