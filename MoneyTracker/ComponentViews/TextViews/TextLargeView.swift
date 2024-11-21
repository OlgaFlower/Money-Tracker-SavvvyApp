//
//  TextLargeView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 21.11.24.
//

import SwiftUI

struct TextLargeView: View {
    
    let text: String
    var alignCenter: Bool = false
    
    var body: some View {
        HStack {
            Text(self.text.uppercased())
                .font(.customFont(style: .medium, size: .large))
                .foregroundStyle(.white)
                .padding(.leading, self.alignCenter ? 0 : 16)
            if !self.alignCenter {
                Spacer()
            }
        }
    }
}

#Preview {
    TextLargeView(text: "WELCOME")
}
