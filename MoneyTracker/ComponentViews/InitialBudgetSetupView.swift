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
            self.titleView
            self.subtitleView
            self.addNewBudgetButton
                .padding(.top, 20)
        }
    }
    
    // MARK: - Views
    private var titleView: some View {
        Text("A budget First,")
            .font(.system(size: 18, weight: .bold, design: .default))
            .foregroundStyle(Color(uiColor: .tertiaryLabel))
    }
    
    private var subtitleView: some View {
        Text("then you can start Savvving.")
            .font(.system(size: 18, weight: .bold, design: .default))
            .foregroundStyle(Color(uiColor: .secondaryLabel))
    }
    
    private var addNewBudgetButton: some View {
        PinkButtonView(
            title: "New Budget",
            systemImage: "plus",
            isHeavyFont: true
        )
        .frame(width: 196)
        .shadow(color: .pink.opacity(0.3), radius: 15, x: -7, y: 7)
        .onTapGesture {
            VibrateService.vibrateMedium()
        }
    }
}

#Preview {
    InitialBudgetSetupView()
}
