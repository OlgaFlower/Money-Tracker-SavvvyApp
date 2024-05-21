//
//  CategoriesCellView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 20.05.24.
//

import SwiftUI

struct CategoriesCellView: View {
    // MARK: - Environment -
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Properties
    let categories: [Category]
    
    // MARK: - State -
    @Binding var selectedCategory: Category
    
    // MARK: - Body -
    var body: some View {
        LazyVStack {
            ForEach(self.categories, id: \.self) { item in
                self.makeCellView(item: item)
            }
        }
    }
    
    private func makeCellView(item: Category) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.white.opacity(0.07))
                .padding(.leading, 40)
                .padding(.trailing, -10)
            VStack(spacing: 0) {
                Spacer()
                HStack {
                    Text(item.name)
                        .font(.title3)
                        .onTapGesture {
                            self.selectedCategory = item
                            self.dismiss()
                        }
                    Spacer()
                    
                }
                .padding(.leading, 72)
            .padding(.bottom, 8)
            }
        }
        .padding(.vertical, 1)
    }
}

#Preview {
    CategoriesCellView(
        categories:
            [Category(moneyGroupType: .regularIncome, 
                      name: "Salary",
                      icon: "sun.max"),
             Category(moneyGroupType: .regularIncome, 
                      name: "Scholarship",
                      icon: "sunrise"),
             Category(moneyGroupType: .regularIncome, 
                      name: "Government aid",
                      icon: "sunset"),
             Category(moneyGroupType: .regularIncome, 
                      name: "Pension",
                      icon: "sun.horizon")
            ],
        selectedCategory: .constant(Category(moneyGroupType: .regularIncome, 
                                             name: "Pension",
                                             icon: "sun.horizon")
        )
    )
}
