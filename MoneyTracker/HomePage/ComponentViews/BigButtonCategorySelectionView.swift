//
//  BigButtonCategorySelectionView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 20.05.24.
//

import SwiftUI

struct BigButtonCategorySelectionView: View {
    
    @Binding var hideRectangle: Bool
    
    // MARK: - Properties -
    let title: String
    let icon: String
    
    // MARK: - Body -
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .foregroundStyle(Color.lightBlue.opacity(self.hideRectangle ? 0 : 0.4))
            
            HStack(spacing: 16) {
                Image(systemName: icon)
                Text(title)
                    .font(.customFont(style: .regular, size: .body))
            }
        }
        .clipShape(.rect(cornerRadius: 10, style: .continuous))
        ///Light White Border
        .background {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(.white.opacity(self.hideRectangle ? 0 : 0.6), lineWidth: 0.7)
        }
        /// Adding Shadow
        .shadow(color: .black.opacity(self.hideRectangle ? 0 : 0.4), radius: 10, x: 5, y: 5)
        .frame(width: UIScreen.main.bounds.width * 0.55 + 20, height: 100 + 20)
    }
}

// MARK: - Preview -
#Preview {
    CategoryGroupSelectionView(
        recordType: .constant(.expense),
        selectedCategory: .constant(.init(moneyGroupType: .recurringExpense,
                                          name: RegularIncome.salary.string,
                                          icon: RegularIncome.salary.icon)
        )
    )
}
