//
//  RecurringCategoryCellView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 20.05.24.
//

import SwiftUI

struct RecurringCategoryCellView: View {
    // MARK: - Environment -
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Properties
    let viewModel: RecurringCategoryCellViewModel
    
    // MARK: - State -
    @Binding var selectedCategory: Category
    
    // MARK: - Body -
    var body: some View {
        LazyVStack {
            ForEach(self.viewModel.recurringGroups, id: \.self) { group in
                HStack {
                    Text(group.sectionTitle)
                        .padding(.leading, 40)
                        .padding(.vertical)
                    Spacer()
                }
                ForEach(group.categoryItems, id: \.self) { item in
                    self.makeCellView(item: item)
                }
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
                HStack(spacing: 16) {
                    Image(systemName: item.icon)
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
    RecurringCategoryCellView(
        viewModel: RecurringCategoryCellViewModel(),
        selectedCategory: .constant(
            Category(
                moneyGroupType: .regularIncome,
                name: "Pension",
                icon: "sun.horizon"
            )
        )
    )
}
