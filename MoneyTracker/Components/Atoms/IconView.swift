//
//  IconView.swift
//  Monika
//
//  Created by Olha Bereziuk on 07.03.25.
//

import SwiftUI

struct IconView: View {
    
    var iconName: String
    var color: Color
    
    var body: some View {
        Image(systemName: self.iconName)
            .frame(width: 22, height: 22)
            .font(
                .system(
                    size: 20,
                    weight: .regular,
                    design: .default
                )
            )
            .foregroundStyle(self.color)
    }
}

#Preview {
    IconView(
        iconName: "star",
        color: .blue
    )
}
