//
//  ButtonTitleView.swift
//  Monika
//
//  Created by Olha Bereziuk on 07.03.25.
//

import SwiftUI

struct ButtonTitleView: View {
    
    var title: String
    var isActive: Bool
    
    var body: some View {
        Text(self.title)
            .font(
                .system(
                    size: 16,
                    weight: .medium,
                    design: .default
                )
            )
            .foregroundStyle(self.isActive ? .white : .primary.opacity(0.3))
    }
}

#Preview {
    Group {
        ButtonTitleView(
            title: "Save",
            isActive: true
        )
        
        ButtonTitleView(
            title: "Save",
            isActive: false
        )
    }
}
