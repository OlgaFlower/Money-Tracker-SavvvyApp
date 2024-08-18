//
//  TodayChartView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 26.06.24.
//

import SwiftUI

struct TodayChartView: View {
    
    // MARK: - Properties
    var animatedLeftover: Double
    var animatedBudget: Double
    var leftoverTextColor: Color
    var animateChart: Bool
    
    // MARK: - Body
    var body: some View {
        self.makeChart()
    }
    
    // MARK: - Views
    private func makeChart() -> some View {
        Gauge(
            value: self.animatedLeftover,
            in: 0...self.animatedBudget
        ) {
        } currentValueLabel: {
            Text("LEFTOVER")
                .font(.customFont(style: .regular, size: .body))
                .foregroundStyle(.white.opacity(0.9))
            Text(" \(String(describing: self.animatedLeftover).formatAsCurrency())")
                .contentTransition(.numericText())
                .animation(.linear, value: self.animatedLeftover)
        }
        .gaugeStyle(ChartHalfDonut(
            leftoverColor: self.leftoverTextColor,
            animateChart: self.animateChart)
        )
    }
}

// MARK: - Preview
#Preview {
    TodayChartView(
        animatedLeftover: 9.90,
        animatedBudget: 7.88,
        leftoverTextColor: .red,
        animateChart: false
    )
}
