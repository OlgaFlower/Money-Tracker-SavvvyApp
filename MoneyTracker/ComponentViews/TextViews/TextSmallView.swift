//
//  TextSmallView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 18.08.24.
//

import SwiftUI

struct TextSmallView: View {
    
    let text: String
    
    var body: some View {
        Text(text.uppercased())
            .font(.customFont(style: .regular, size: .small))
            .foregroundStyle(.white.opacity(0.9))
    }
}

#Preview {
    TextSmallView(text: "Text example")
}
