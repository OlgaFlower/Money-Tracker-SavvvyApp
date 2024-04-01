//
//  ChartHalfDonut.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 01.04.24.
//

import SwiftUI

struct ChartHalfDonut: GaugeStyle {
    
    private var gradient = LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .leading, endPoint: .trailing)
    private var width = UIScreen.main.bounds.width * 0.5
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 0.65 * configuration.value)
                .stroke(gradient, style: StrokeStyle(lineWidth: 24, lineCap: .round))
                .rotationEffect(.degrees(153))
            
            Circle()
                .trim(from: 0, to: 0.65)
                .stroke(Color.black, style: StrokeStyle(lineWidth: 10, lineCap: .butt, lineJoin: .round, dash: [1, 24], dashPhase: 10.0))
                .rotationEffect(.degrees(153))
            
            VStack(spacing: 12) {
                configuration.currentValueLabel
                    .font(.system(size: 30, weight: .bold, design: .monospaced))
                    .foregroundColor(.mainNavy)
                
                Text("EUR")
                    .font(.system(.title, design: .monospaced))
                    .bold()
                    .foregroundColor(.mainNavy)
            }
            .padding(.top, 24)
        }
        .frame(width: self.width)
    }
}

#Preview {
    DailyBalanceChartView()
}
