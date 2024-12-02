//
//  TextCellView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 02.12.24.
//

import SwiftUI

struct TextCellView: View {
    
    // MARK: - Properties
    var item: String
    
    // MARK: - Body
    var body: some View {
        
        VStack(spacing: 0) {
            HStack {
                Text(self.item)
                    .lineLimit(1)
                    .font(
                        .customFont(
                            style: .regular, size: .body
                        )
                    )
                    .padding(.leading, 8)
            }
            .opacity(0.9)
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    TextCellView(item: "Tesst")
}
