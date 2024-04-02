//
//  ChartView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 31.03.24.
//

import SwiftUI
import Charts

struct DailyBalanceChartView: View {
    
    // MARK: - Properties
    private let minValue: Double = 0.00
    private var startBalance: Double = 9.99
    @State private var currentBalance: Double = 9.99
    @State private var showingAddExpensesView = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(.blue.opacity(0.1))
            
                VStack(spacing: 24) {
                    self.makeChart()
                        .padding(.top)
            }
            .padding(.top, 25)
        }
    }
    
    // MARK: - Views
    private func makeChart() -> some View {
        Gauge(value: currentBalance, in: 0...startBalance) {
        } currentValueLabel: {
            Text("\(self.currentBalance, specifier: "%.2f")")
        }
        .gaugeStyle(ChartHalfDonut())
    }
}

// MARK: - Preview
#Preview {
    DailyBalanceChartView()
}


