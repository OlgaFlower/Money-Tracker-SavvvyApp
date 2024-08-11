//
//  IconView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 25.06.24.
//

import SwiftUI

struct IconView: View {
    
    var iconName: String
    var frameWidth: CGFloat
    
    var body: some View {
        Image(systemName: self.iconName)
            .font(.title3)
            .frame(
                width: self.frameWidth,
                height: self.frameWidth
            )
            .opacity(0.8)
    }
}

#Preview {
    IconView(iconName: "heart", frameWidth: 45)
}
