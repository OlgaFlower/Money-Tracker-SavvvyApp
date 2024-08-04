//
//  DetailCellView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 25.06.24.
//

import SwiftUI

struct DetailCellView: View {
    
    var iconName: String
    var note: String
    var sum: String
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                IconView(iconName: iconName, frameWidth: 38)
                Text(note)
                    .font(.customFont(style: .regular, size: .body))
                    .padding(.leading, 8)
                Spacer()
                Text("\(sum)€")
                    .font(.customFont(style: .regular, size: .body))
            }
            .opacity(0.8)
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    DetailCellView(iconName: "heart", note: "Some test note", sum: "32,84")
}
