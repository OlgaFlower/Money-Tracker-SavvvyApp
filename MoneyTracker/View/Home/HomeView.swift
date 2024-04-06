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
    @State private var isAddIncomeShowing = false
    @State private var isAddExpensesShowing = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            self.background
            VStack(spacing: 80) {
                self.makeChart()
                HStack {
                    self.makeAddIncomeView()
                        .frame(width: 30)
                    Spacer()
                    self.makeAddExpenseView()
                        .frame(width: 30)
                }
                .frame(height: 30)
                .padding(.horizontal, 80)
                .padding(.top, 40)
                Spacer()
            }
            .padding(.top, 80)
        }
    }
    
    // MARK: - Views
    
    private func makeAddExpenseView() -> some View {
            Button(action: {
                self.isAddExpensesShowing.toggle()
            }, label: {
                Image(systemName: "minus")
                    .foregroundStyle(.mainNavy)
                    .font(.title)
                    .fontWeight(.medium)
        })
            .sheet(isPresented: $isAddExpensesShowing) {
                
            }
    }
    
    private func makeAddIncomeView() -> some View {
            Button(action: {
                self.isAddIncomeShowing.toggle()
            }, label: {
                Image(systemName: "plus")
                    .foregroundStyle(.mainNavy)
                    .font(.title)
                    .fontWeight(.medium)
        })
            .sheet(isPresented: $isAddIncomeShowing) {
                AddIncomeView()
            }
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
