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
    private var dayBudget: Double = 65.50
    private let infoBoardWidth = Constants.screenWidth / 2.8
    @State private var currentBalance: Double = 28.61
    @State private var isChangeBudgetViewShowing = false
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            BackgroundGradView()
            
            VStack {
                /// Plus button
                HStack {
                    Spacer()
                    Button(action: {
                        self.isChangeBudgetViewShowing.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .font(Font.system(size: 36))
                            .foregroundStyle(.white)
                    })
                    .fullScreenCover(isPresented: $isChangeBudgetViewShowing, content: MakeNewMoneyFlowRecordView.init)
                }
                .padding(.trailing, 40)
                
                /// Chart View
                // TODO: - Add button or tag gesture over chart - to open detailed view!
                // TODO: - Animated changing of the budget's leftower!
                self.makeChart()
                    .frame(width: 260, height: 260)
                
                /// Budget Information
                self.budgetInformationView
                .padding(.horizontal, 24)
                .padding(.top, 35)
                
                Spacer()
            }
            .padding(.top, 25)
        }
    }
    
    // MARK: - Views
    
    private var budgetInformationView: some View {
        HStack {
            VStack(spacing: 18) {
                Text("SPENT")
                    .font(.title2)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.white.opacity(0.8))
                
                // TODO: - Animated changing of the spent sum!
                Text("36,89")
                    .font(.title2)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.white.opacity(0.8))
            }
            .frame(width: self.infoBoardWidth)
            Rectangle()
                .frame(width: 1, height: 80)
                .foregroundStyle(.white.opacity(0.3))
                .padding(.horizontal, 12)
            
            VStack(spacing: 18) {
                Text("BUDGET")
                    .font(.title2)
                    .fontDesign(.monospaced)
                .foregroundStyle(.white.opacity(0.8))
                
                // TODO: - Animated changing of the budget sum!
                Text("65,50")
                    .font(.title2)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.white.opacity(0.8))
            }
            .frame(width: self.infoBoardWidth)
        }
    }
    
    private func makeChart() -> some View {
        Gauge(
            value: self.currentBalance,
            in: 0...self.dayBudget
        ) {
        } currentValueLabel: {
            Text("\(self.currentBalance, specifier: "%.2f")")
        }
        .gaugeStyle(ChartHalfDonut())
    }
}

#Preview {
    HomeView()
}
