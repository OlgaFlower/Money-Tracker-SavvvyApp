//
//  BackgroundGradView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 21.04.24.
//

import SwiftUI

struct BackgroundGradView: View {
    var body: some View {
        Rectangle()
        .fill(
            .linearGradient(colors: [
                .darkBlue,
                .lightBlue
            ], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundGradView()
}
