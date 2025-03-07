//
//  SelectorButtonView.swift
//  Monika
//
//  Created by Olha Bereziuk on 07.03.25.
//

import SwiftUI

struct SelectorButtonView: View {
    
    var title: String
    var iconName: String
    var roundViewIcon: String = "chevron.right"
    @Binding var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        ZStack {
            self.backgroundView
            HStack {
                SelectorContentView(
                    title: self.title,
                    iconName: self.iconName,
                    iconColor: self.isSelected ? .blue : .secondary)
                Spacer()
                TappableRoundView(
                    iconName: self.roundViewIcon,
                    action: action
                )
            }
        }
    }
    
    private var backgroundView: some View {
        RoundedRectangle(cornerRadius: 22.0)
            .foregroundStyle(.background.secondary)
            .frame(height: 44)
    }
}

#Preview {
    Group {
        SelectorButtonView(
            title: "Country",
            iconName: "flag.circle.fill",
            isSelected: .constant(true),
            action: {}
        )
        
        SelectorButtonView(
            title: "Country",
            iconName: "flag.circle.fill",
            isSelected: .constant(false),
            action: {}
        )
    }
}
