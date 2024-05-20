//
//  DropDownMenuButtonView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 20.05.24.
//

import SwiftUI

struct DropDownMenuButtonView: View {
    // MARK: - Properties -
    let title: String
    
    // MARK: - State -
    @Binding var shouldRotate: Bool
    
    // MARK: - Body -
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Color.lightBlue.opacity(0.4))
                .ignoresSafeArea()
                .frame(height: 50)
            HStack {
                Text(title)
                    .font(.title3.monospaced())
                Spacer()
                Image(systemName: "chevron.right")
                    .rotationEffect(.degrees(shouldRotate ? 90 : 0))
            }
        }
        .foregroundStyle(.white)
    }
}

// MARK: - Preview -
#Preview {
    DropDownMenuButtonView(title: "General Expenses", shouldRotate: .constant(false))
}
