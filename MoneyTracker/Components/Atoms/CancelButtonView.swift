//
//  CancelButtonView.swift
//  Monika
//
//  Created by Olha Bereziuk on 07.03.25.
//

import SwiftUI

struct CancelButtonView: View {
    
    var action: () -> Void
    var color: Color = Color(hex: "E3E3E5")
    
    var body: some View {
        HStack {
            Spacer()
            IconView(
                iconName: "xmark.circle.fill",
                color: self.color
            )
                .font(
                    .system(
                        size: 25,
                        weight: .regular,
                        design: .default
                    )
                )
        }
        .padding(.top, 24)
        .onTapGesture {
            action()
        }
    }
}

#Preview {
    CancelButtonView(action: {})
}
