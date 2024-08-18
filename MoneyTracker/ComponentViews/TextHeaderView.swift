//
//  TextHeaderView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 17.08.24.
//

import SwiftUI

struct TextHeaderView: View {
    
    let text: String
    let centerHeader: Bool
    
    init(text: String, centerHeader: Bool = false) {
        self.text = text
        self.centerHeader = centerHeader
    }
    
    var body: some View {
        HStack {
            Text(text.uppercased())
                .font(.customFont(style: .medium, size: .title))
                .padding(.leading, 16)
            if !centerHeader {
                Spacer()
            }
        }
    }
}

#Preview {
    TextHeaderView(text: "EXPENSES TODAY")
}
