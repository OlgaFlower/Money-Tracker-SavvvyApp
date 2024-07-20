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
                IconView(iconName: iconName, frameWidth: 45)
                Text(note)
                    .font(.customFont(style: .regular, size: .body))
                    .padding(.leading, 8)
                Spacer()
                Text("\(sum)€")
                    .font(.customFont(style: .regular, size: .title))
            }
            .padding(.trailing, 16)
            .opacity(0.8)
            Rectangle()
                .frame(height: 0.5)
                .opacity(0.4)
        }
        .foregroundStyle(.white)
        .padding(.leading, 16)
    }
}

#Preview {
    DetailCellView(iconName: "heart", note: "Some test note", sum: "32,84")
}
