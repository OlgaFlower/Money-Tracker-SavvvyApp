//
//  BigButtonCategorySelectionView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 20.05.24.
//

import SwiftUI

struct BigButtonCategorySelectionView: View {
    
    @Binding var hideRectangle: Bool
    
    // MARK: - Properties
    let title: String
    let icon: String
    
    // MARK: - Body
    var body: some View {
        
        HStack(spacing: 16) {
            Image(systemName: icon)
            TextView(text: title, style: .medium)
        }
        .clipShape(.rect(cornerRadius: 8, style: .continuous))
        .background {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(.lightBlue.opacity(self.hideRectangle ? 0 : 0.5))
                .frame(width: UIScreen.main.bounds.width * 0.55 + 20, height: 100 + 20)
        }
    }
}

// MARK: - Preview
#Preview {
    CategoryGroupSelectionView(
        recordType: .constant(.expense),
        selectedCategory: .constant(.init(moneyGroupType: .recurringExpense,
                                          name: RegularIncome.salary.string,
                                          icon: RegularIncome.salary.icon)
        )
    )
}
