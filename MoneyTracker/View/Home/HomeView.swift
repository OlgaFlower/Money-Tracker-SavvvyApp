//
//  HomeView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 20.03.24.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    @State private var currentDate : Date = Date()
    
    // MARK: - Body
    var body: some View {
        
        NavigationStack {
            
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 8) {
                    ///Custom Date Picker
                    CustomDatePicker(currentDate: self.$currentDate)
                    
                    /// Bank Card
                    BankCardView()
                        .padding(.horizontal, 12)
                    
                    /// Date Range Picker
                    TotalLogExplorer()
                        .padding()
                    
                    Spacer()
                }
            }
            .navigationTitle("March 2024")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitleTextColor(.mainNavy)
        }
    }
    
    // MARK: - Views
    
}

#Preview {
    HomeView()
}
