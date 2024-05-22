//
//  CategoryGroupSelectionView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 14.05.24.
//

import SwiftUI

struct CategoryGroupSelectionView: View {
    // MARK: - Environment -
    @Environment(\.dismiss) var dismiss
    
    // MARK: - State -
    @Binding var recordType: RecordType
    @Binding var selectedCategory: Category
    
    // MARK: - Body -
    var body: some View {
        ZStack {
            BackgroundGradView()
            VStack {
                Spacer()
                self.closeButton
            }
            switch self.recordType {
            case .expense:
                /// EXPENSES
                VStack(spacing: 40) {
                    /// General
                    BigButtonCategorySelectionView(
                        title: "GENERAL",
                        icon: "basket"
                    )
                    /// Recurring
                    BigButtonCategorySelectionView(
                        title: "RECURRING",
                        icon: "arrow.clockwise"
                    )
                }
                .padding(.bottom, 32)
                
                /// INCOME
            case .income:
                VStack(spacing: 40) {
                    /// Regular
                    BigButtonCategorySelectionView(
                        title: "REGULAR",
                        icon: "bag"
                    )
                    /// Temporary
                    BigButtonCategorySelectionView(
                        title: "TEMPORARY",
                        icon: "bubbles.and.sparkles"
                    )
                }
                .padding(.bottom, 32)
            }
        }
        .foregroundStyle(.white)
    }
    
    // MARK: - Views -
    
    private var closeButton: some View {
        Button(action: {
            self.dismiss()
        }, label: {
            Image(systemName: "chevron.compact.down")
                .font(Font.system(size: 28))
                .opacity(0.8)
        })
        .padding(.bottom, 32)
    }
}

#Preview {
    CategoryGroupSelectionView(
        recordType: .constant(.expense),
        selectedCategory: .constant(.init(moneyGroupType: .regularIncome,
                                          name: RegularIncome.salary.string,
                                          icon: RegularIncome.salary.icon)
        )
    )
}
