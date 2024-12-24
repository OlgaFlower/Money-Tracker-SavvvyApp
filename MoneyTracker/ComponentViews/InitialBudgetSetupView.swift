//
//  InitialBudgetSetupView.swift
//  Savvvy
//
//  Created by Olha Bereziuk on 15.12.24.
//

import SwiftUI

struct InitialBudgetSetupView: View {
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 4) {
            self.styledText("A budget First,")
                .foregroundStyle(Color(uiColor: .tertiaryLabel))
            self.styledText("then you can start Savvving.")
                .foregroundStyle(Color(uiColor: .secondaryLabel))
        }
    }
    
    // MARK: - Views
    private func styledText(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 18, weight: .bold, design: .default))
    }
}

#Preview {
    InitialBudgetSetupView()
}
