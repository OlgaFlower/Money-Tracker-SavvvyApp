//
//  HomeView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 20.03.24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                /// Background
                Rectangle()
                    .fill(.navy)
                    .ignoresSafeArea()
                
                
                
                ScrollView {
                    
                    VStack(spacing: 16) {
                        /// Bank Card
                        BankCardView()
                            .padding(.horizontal, 22)
                        
                        
                        Spacer()
                    }
                    .padding(.top, 22)
                }
            }
            .navigationTitle("Today")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitleTextColor(.white)
        }
    }
    
    // MARK: - Views
    
}

#Preview {
    HomeView()
}
