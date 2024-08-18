//
//  CancelButtonView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 16.08.24.
//

import SwiftUI

struct CancelButtonView: View {
    // MARK: - Action
    let action: () -> Void
    
    // MARK: - Body
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                Constants.vibrateLight()
                action()
            }) {
                Image(systemName: "plus")
                    .font(.customFont(style: .medium, size: .title))
                    .opacity(0.8)
                    .rotationEffect(.degrees(45))
                    .padding(.top)
                    .padding(.horizontal, 16)
                    
            }
            .frame(width: 60)
        }
    }
}

#Preview {
    CancelButtonView(action: {})
}
