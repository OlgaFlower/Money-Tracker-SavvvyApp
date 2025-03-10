//
//  RecurringFormTxtView.swift
//  Monika
//
//  Created by Olha Bereziuk on 07.03.25.
//

import SwiftUI

struct RecurringFormTxtView: View {
    
    var text: String
    var fontSize: CGFloat = 16
    var weight: Font.Weight = .medium
    var color: Color = .primary
    
    var body: some View {
        Text(self.text)
            .font(
                .system(
                    size: self.fontSize,
                    weight: self.weight,
                    design: .default
                )
            )
            .foregroundStyle(self.color)
    }
}

#Preview {
    RecurringFormTxtView(text: "Every ... Days")
}
