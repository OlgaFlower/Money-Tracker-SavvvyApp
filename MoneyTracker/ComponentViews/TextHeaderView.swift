//
//  TextHeaderView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 17.08.24.
//

import SwiftUI

struct TextHeaderView: View {
    
    let text: String
    var alignCenter: Bool = false
    
    var body: some View {
        HStack {
            Text(self.text.uppercased())
                .font(.customFont(style: .medium, size: .title))
                .foregroundStyle(.white)
                .padding(.leading, 16)
            if !self.alignCenter {
                Spacer()
            }
        }
    }
}

#Preview {
    TextHeaderView(text: "EXPENSES TODAY")
}
