//
//  ChartHalfDonut.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 01.04.24.
//

import SwiftUI

struct ChartHalfDonut: GaugeStyle {
    
    // MARK: - Properties
    private var gradient = LinearGradient(gradient: Gradient(colors: [.lightBlue, .chartGreen, .red]), startPoint: .leading, endPoint: .trailing)
    private var gradientCircleWidth = Constants.screenWidth * 0.6
    private var dashesWidth = Constants.screenWidth * 0.73
    private var thinCircleWidth = Constants.screenWidth * 0.68
    
    // MARK: - Views
    func makeBody(configuration: Configuration) -> some View {
        
        ZStack {
            /// Thin circle
            Circle()
                .stroke(Color.white.opacity(0.8))
            
            /// Empty Gradient line
            Circle()
                .trim(from: 0, to: 1.0)
                .stroke(.white.opacity(0.1), style: StrokeStyle(lineWidth: 17, lineCap: .round))
                .rotationEffect(.degrees(153))
                .frame(width: self.gradientCircleWidth)
            
            /// Gradient line
            Circle()
                .trim(from: 0, to: 0.65 * configuration.value)
                .stroke(gradient, style: StrokeStyle(lineWidth: 17, lineCap: .round))
                .rotationEffect(.degrees(153))
                .frame(width: self.gradientCircleWidth)
            
            /// Dashes
            Circle()
                .trim(from: 0, to: 0.65)
                .stroke(Color.white.opacity(0.8), style: StrokeStyle(lineWidth: 9, lineCap: .butt, lineJoin: .round, dash: [1, 24], dashPhase: 10.0))
                .rotationEffect(.degrees(153))
                .frame(width: self.dashesWidth)
            
            VStack(spacing: 12) {
                
                /// Current balance
                configuration.currentValueLabel
                    .font(.system(size: 30, weight: .bold, design: .monospaced))
                    .foregroundColor(.white)
                
                /// Currency
                Text("EUR")
                    .font(.system(.title, design: .monospaced))
                    .bold()
                    .foregroundColor(.white)
            }
            .padding(.top, 24)
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
