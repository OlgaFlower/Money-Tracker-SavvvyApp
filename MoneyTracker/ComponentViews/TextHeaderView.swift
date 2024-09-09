//
//  TextHeaderView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 17.08.24.
//

import SwiftUI

struct TextHeaderView: View {
    
    let text: String
    
    var body: some View {
        HStack {
            Text(text.uppercased())
                .font(.customFont(style: .medium, size: .title))
                .padding(.leading, 16)
                Spacer()
        }
    }
}

#Preview {
    TextHeaderView(text: "EXPENSES TODAY")
}
