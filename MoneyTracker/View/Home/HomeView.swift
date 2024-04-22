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
    private let infoBoardWidth = Constants.shared.screenWidth / 2.8
    @State private var currentBalance: Double = 28.61
    @State private var isAddIncomeShowing = false
    @State private var isAddExpensesShowing = false
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            BackgroundGradView()
            
            VStack {
                /// Plus button
                HStack {
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "plus")
                            .font(Font.system(size: 36))
                            .foregroundStyle(.white)
                    })
                }
                .padding(.trailing, 40)
                
                /// Chart View
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
                
                Text("65,50")
                    .font(.title2)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.white.opacity(0.8))
            }
            .frame(width: self.infoBoardWidth)
        }
    }
    
//    private func makeAddIncomeView() -> some View {
//            Button(action: {
//                self.isAddIncomeShowing.toggle()
//            }, label: {
//                Image(systemName: "plus")
//                    .foregroundStyle(.white)
//                    .font(.title)
//                    .fontWeight(.medium)
//        })
//            .sheet(isPresented: $isAddIncomeShowing) {
//                AddIncomeView()
//            }
//    }
    
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
