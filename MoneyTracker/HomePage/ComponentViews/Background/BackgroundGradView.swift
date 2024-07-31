//
//  BackgroundGradView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 21.04.24.
//

import SwiftUI

struct BackgroundGradView: View {
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.darkBlue, .lightBlue]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(
                    width: geometry.size.width + 20,
                    height: geometry.size.height + 20
                )
                .position(
                    x: geometry.size.width / 2,
                    y: geometry.size.height / 2
                )
        }
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundGradView()
}
