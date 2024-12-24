//
//  HomeView.swift
//  Savvvy
//
//  Created by Olha Bereziuk on 14.12.24.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - States
    @State var isButtonActive: Bool = true
    @State private var showNewRecordView: Bool = false
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            self.backgroundView
            HomeHeaderView()
                .padding(.horizontal, 20)
            VStack {
                InitialBudgetSetupView()
                self.newBudgetButton
            }
        }
        .slideUpView(isPresented: self.$showNewRecordView) {
            NewRecordView(onDismiss: {
                self.showNewRecordView.toggle()
            })
        }
    }
    
    //MARK: - Views
    private var backgroundView: some View {
        Color(uiColor: UIColor.secondarySystemBackground)
            .ignoresSafeArea()
    }
    
    private var newBudgetButton: some View {
        PinkButtonView(
            isActive: self.$isButtonActive,
            title: "New Budget",
            systemImage: "plus",
            isHeavyFont: true,
            action: {
                VibrateService.vibrateMedium()
                self.showNewRecordView.toggle()
            }
        )
        .frame(width: 196)
        .padding(.top, 20)
        .shadow(
            color: .pink.opacity(0.3),
            radius: 20, x: -7, y: 7
        )
    }
}

// MARK: - Preview
#Preview {
    HomeView()
}
