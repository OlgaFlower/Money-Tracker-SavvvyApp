//
//  DetailCellView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 25.06.24.
//

import SwiftUI

struct DetailCellView: View {
    
    var iconName: String
    var note: String
    var sum: String
    var category: MoneyGroupType
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                IconView(iconName: iconName, frameWidth: 34)
                Text(note)
                    .lineLimit(1)
                    .font(.customFont(style: .regular, size: .body))
                    .padding(.leading, 8)
                Spacer()
                self.makeSumStringView(for: self.category)
                    .font(.customFont(style: .regular, size: .body))
                    .padding(.leading, 4)
            }
            .opacity(0.9)
        }
        .foregroundStyle(.white)
    }
    
    @ViewBuilder
    private func makeSumStringView(for type: MoneyGroupType) -> some View {
        switch self.category {
        case .generalExpense, .recurringExpense:
            Text("-\(sum)€")
        case .regularIncome, .temporaryIncome:
            Text("+\(sum)€")
        case .none:
            EmptyView()
        }
    }
}

#Preview {
    DetailCellView(
        iconName: "heart",
        note: "Some test note",
        sum: "32,84",
        category: .generalExpense
    )
}
