//
//  TitleForBtnView.swift
//  Monika
//
//  Created by Olha Bereziuk on 07.03.25.
//

import SwiftUI

struct TitleForBtnView: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(
                .system(
                    size: 16,
                    weight: .regular,
                    design: .default
                )
            )
    }
}

#Preview {
    TitleForBtnView(title: "Category")
}
