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
    var action: () -> Void
    
    var body: some View {
        ZStack {
            self.backgroundView
            HStack {
                SelectorContentView(title: title, iconName: iconName)
                Spacer()
                TappableRoundView(iconName: roundViewIcon, action: action)
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
    SelectorButtonView(
        title: "Country",
        iconName: "flag.circle.fill",
        action: {}
    )
}
