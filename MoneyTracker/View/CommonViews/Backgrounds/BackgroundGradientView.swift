//
//  BackgroundGradientView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 21.03.24.
//

import SwiftUI

struct BackgroundGradientView: View {
    var body: some View {
        Rectangle()
        .fill(
            .linearGradient(colors: [
                .gradientBackgroundTop,
                .gradientBackgroundBottom
            ], startPoint: .top, endPoint: .bottom)
        )
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundGradientView()
}
