//
//  HomeView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 31.03.24.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - States
    /// Views
    @StateObject private var viewModel = HomeViewModel()
    @State var isMakeNewRecordViewPresented = false
    @State var isDetailCellViewPresented = false
    @State private var showingAlert = false
    /// Animations
    @State var animateChart = false
    @State private var animatedLeftover: Double = 0.0
    @State private var animatedBudget: Double = 0.0
    @State private var animatedExpenses: Int = 0
    
    // MARK: - Body
    var body: some View {
        ZStack {
            BackgroundGradView()
            VStack {
                /// Plus Button
                self.plusButtonView
                
                /// Chart View
                TodayChartView(
                    animatedLeftover: self.animatedLeftover,
                    animatedBudget: self.animatedBudget,
                    leftoverTextColor: self.viewModel.leftoverTextColor,
                    animateChart: self.animateChart
                )
                .frame(width: 260, height: 260)
                .onTapGesture {
                    self.animateChart = true
                    self.viewModel.vibrate()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.animateChart = false
                    }
                }
                
                /// Budget Information Board
                HorizontalBudgetBoardView(
                    showingAlert: self.$showingAlert,
                    isDetailCellViewPresented: self.$isDetailCellViewPresented,
                    animatedExpenses: self.animatedExpenses,
                    animatedBudget: self.animatedBudget, 
                    updateAnimatedValues: self.updateAnimatedValues
                )
                .padding(.horizontal, 24)
                .padding(.top, 35)
                
                Spacer()
            }
            .padding(.top, 25)
        }
        .onAppear {
            self.updateAnimatedValues()
        }
    }
    
    // MARK: - Views
    private var plusButtonView: some View {
        HStack {
            Spacer()
            Button(action: {
                self.viewModel.vibrateLight()
                self.isMakeNewRecordViewPresented.toggle()
            }, label: {
                Image(systemName: "plus")
                    .font(Font.system(size: 36))
                    .foregroundStyle(.white)
            })
            .fullScreenCover(
                isPresented: self.$isMakeNewRecordViewPresented) {
                    withAnimation {
                        self.updateAnimatedValues()
                    }
                }
        content: { MakeNewMoneyRecordView(
            viewModel: MakeNewMoneyRecordViewModel()
          )}
        }
        .padding(.trailing, 40)
    }
    
    // MARK: - Methods
    private func updateAnimatedValues() {
        self.animatedLeftover = self.viewModel.leftover
        self.animatedBudget = self.viewModel.dayBudget
        self.animatedExpenses = self.viewModel.todayExpenses
    }
}

// MARK: - Preview
#Preview {
    HomeView()
}
