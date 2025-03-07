//
//  WelcomeView.swift
//  Savvvy
//
//  Created by Olha Bereziuk on 15.12.24.
//

import SwiftUI

struct WelcomeView: View {
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 4) {
            Text("Welcome!")
                .font(.system(size: 22, weight: .medium, design: .default))
                .padding(.bottom)
            Text ("Add your first budget now and start tracking your expenses with ease!")
                .font(.system(size: 18, weight: .regular, design: .default))
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    WelcomeView()
}
