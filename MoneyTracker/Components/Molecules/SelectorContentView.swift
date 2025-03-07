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
    
    var body: some View {
        HStack(spacing: 10) {
            IconView(iconName: iconName)
                .padding(.leading, 15)
            TitleForBtnView(title: title)
        }
    }
}

#Preview {
    SelectorContentView(
        title: "Category",
        iconName: "star"
    )
}
