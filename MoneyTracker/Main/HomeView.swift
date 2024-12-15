//
//  HomeView.swift
//  Savvvy
//
//  Created by Olha Bereziuk on 14.12.24.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color(uiColor: UIColor.secondarySystemBackground)
                .ignoresSafeArea()
            HomeHeaderView()
                .padding(.horizontal, 20)
            InitialBudgetSetupView()
        }
    }
    
    //MARK: - Views
}

#Preview {
    HomeView()
}
