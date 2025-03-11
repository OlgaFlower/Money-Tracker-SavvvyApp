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
        Image(systemName: self.icon)
            .foregroundColor(self.color)
            .frame(width: 30, height: 30)
    }
}


#Preview {
    CategoryIconView(
        icon: "cart.fill",
        color: .green
    )
}
