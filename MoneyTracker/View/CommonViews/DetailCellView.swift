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
        VStack {
            HStack {
                IconView(iconName: iconName, frameWidth: 45)
                Text(note)
                    .font(.system(size: 18))
                    .fontDesign(.monospaced)
                    .padding(.leading, 8)
                Spacer()
                Text("\(sum)€")
                    .font(.system(size: 22))
                    .fontDesign(.monospaced)
            }
            .padding(.trailing, 16)
            Rectangle()
                .frame(height: 0.5)
                .opacity(0.5)
        }
        .foregroundStyle(.white)
        .padding(.leading, 16)
    }
}

#Preview {
    DetailCellView(iconName: "heart", note: "Some test note", sum: "32,84")
}
