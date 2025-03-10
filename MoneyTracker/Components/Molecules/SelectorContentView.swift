//
//  SelectorContentView.swift
//  Monika
//
//  Created by Olha Bereziuk on 07.03.25.
//

import SwiftUI

struct SelectorContentView: View {
    
    var title: String
    var iconName: String
    var iconColor: Color
    
    var body: some View {
        HStack(spacing: 10) {
            IconView(
                iconName: self.iconName,
                color: self.iconColor
            )
                .padding(.leading, 15)
            TitleForBtnView(title: self.title)
        }
    }
}

#Preview {
    SelectorContentView(
        title: "Category",
        iconName: "star", 
        iconColor: .blue
    )
}
