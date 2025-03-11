//
//  CategoryIconView.swift
//  Monika
//
//  Created by Olha Bereziuk on 11.03.25.
//

import SwiftUI

struct CategoryIconView: View {
    
    let icon: String
    let color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .foregroundStyle(self.color.opacity(0.15))
            .frame(width: 32, height: 32)
            .overlay (
                Image(systemName: self.icon)
                    .foregroundColor(self.color)
                    .frame(width: 28, height: 28)
            )
    }
}


#Preview {
    CategoryIconView(
        icon: "cup.and.saucer.fill",
        color: .brown
    )
}
