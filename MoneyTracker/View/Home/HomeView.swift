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
                
                ScrollView {
                    
                    VStack() {
                        /// Bank Card
                        BankCardView()
                            .padding(.horizontal, 12)
                        Spacer()
                    }
                    .padding(.top, 22)
                }
            .navigationTitle("Today")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    // MARK: - Views
    
}

#Preview {
    HomeView()
}
