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
    private var startBalance: Double = 9999.99
    @State private var currentBalance: Double = 9999.99
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(.blue.opacity(0.1))
            
                VStack(spacing: 24) {
                    self.makeChart()
                        .padding(.top)
                    
                    HStack {
                        Button(action: {
                            currentBalance = startBalance
                        }, label: {
                            Image(systemName: "arrow.counterclockwise")
                                .foregroundColor(.mainNavy)
                                .fontWeight(.bold)
                                .font(.largeTitle)
                        })
                        Spacer()
                        Button(action: {
                            currentBalance -= 13.45
                        }, label: {
                            Image(systemName: "minus")
                                .foregroundColor(.mainNavy)
                                .fontWeight(.bold)
                                .font(.largeTitle)
                        })
                    }
                    .padding(.horizontal, 52)
                .padding(.top, 25)
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


