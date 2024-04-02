//
//  HomeView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 31.03.24.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    private let minValue: Double = 0.00
    private var startDailyBalance: Double = 9.99
    @State private var currentBalance: Double = 9.99
    @State private var showingAddExpensesView = false
    @State private var isMenuViewVisible = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            self.background
            VStack(spacing: 100) {
                self.makeChart()
                self.makeAddExpenseItemView()
                Spacer()
            }
            .padding(.top, 100)
        }
    }
    
    // MARK: - Views
    
    private func makeAddExpenseItemView() -> some View {
            Button(action: {
                
            }, label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.mainNavy)
                    .font(.title)
                    .fontWeight(.medium)
        })
    }
    
    private func makeChart() -> some View {
        Gauge(
            value: self.currentBalance,
            in: 0...self.startDailyBalance
        ) {
        } currentValueLabel: {
            Text("\(self.currentBalance, specifier: "%.2f")")
        }
        .gaugeStyle(ChartHalfDonut())
    }
    
    private var background: some View {
        let color: Color = self.currentBalance <= 0 ? .red : .blue
        let opacity: Double = self.currentBalance <= 0 ? 0.4 : 0.05
        
        return Rectangle()
            .fill(color.opacity(opacity))
            .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
