//
//  CategoryRow.swift
//  Monika
//
//  Created by Olha Bereziuk on 11.03.25.
//

import SwiftUI

struct CategoryRow: View {
    
    let category: Category
    
    var body: some View {
        HStack(spacing: 10) {
            CategoryIconView(
                icon: category.icon,
                color: category.color
            )
            CategoryLabel(text: category.name)
            Spacer()
        }
    }
}

#Preview {
    CategoryRow(
        category: Category(
            name: "Eating out",
            icon: "cup.and.saucer.fill",
            color: .brown
        )
    )
}
