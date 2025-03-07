//
//  TappableRoundView.swift
//  Monika
//
//  Created by Olha Bereziuk on 07.03.25.
//

import SwiftUI

struct TappableRoundView: View {
    
    var iconName: String
    var action: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .frame(width: 33, height: 33)
                .foregroundStyle(.background.tertiary)
            
            Image(systemName: iconName)
                .foregroundStyle(.pink)
        }
        .padding(.trailing, 8)
        .onTapGesture {
            VibrateService.vibrateMedium()
            action()
        }
    }
}

#Preview {
    ZStack {
        Rectangle()
            .ignoresSafeArea()
        TappableRoundView(
            iconName: "chevron.right",
            action: {}
        )
    }
}
