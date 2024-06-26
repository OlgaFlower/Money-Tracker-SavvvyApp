//
//  HomeView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 31.03.24.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    // MARK: - State
    /// Player
    @StateObject var player = AudioPlayer()
    /// Views
    @State var isMakeNewRecordViewPresented = false
    @State var isDetailCellViewPresented = false
    @State private var showingAlert = false
    /// Animations
    @State var animateChart = false
    @State private var animatedLeftover: Double = 0.0
    @State private var animatedBudget: Double = 0.0
    @State private var animatedExpenses: Int = 0
    
    // MARK: - Properties
    /// DB
    /// Today Records
    private var todayRecordsFetchRequest = CoreDataManager.fetchTodayRecords()
    private var todayRecords: FetchedResults<Money> {
        todayRecordsFetchRequest.wrappedValue
    }
    
    /// Month Income
    private var monthIncomeFetchRequest = CoreDataManager.fetchCurrentMonthRecords()
    private var monthIncome: FetchedResults<Money> {
        monthIncomeFetchRequest.wrappedValue
    }
    
    /// Properties
    private var viewModel = HomeViewModel()
    
    private var expenses: Int {
        return self.viewModel.calcExpenses(records: todayRecords)
    }
    
    private var budget: Double {
        self.viewModel.calcDayBudget(records: monthIncome)
    }
    
    private var leftover: Double {
        self.viewModel.calcLeftover(dayBudget: budget, expenses: expenses)
    }
    
    private var leftoverTextColor: Color {
        self.viewModel.calcLeftoverColor(dayBudget: self.budget, leftover: self.leftover)
    }
    
    // MARK: - Body
    var body: some View {
        ZStack {
            BackgroundGradView()
            VStack {
                /// Plus button
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
                                self.playSound()
                                self.updateAnimatedValues()
                            }
                        }
                        content: {
                            MakeNewMoneyRecordView(
                                viewModel: MakeNewMoneyRecordViewModel()
                            )
                        }
                }
                .padding(.trailing, 40)
                
                /// Chart View
                // TODO: - Add button or gesture over chart - to open detailed view!
                // TODO: - Animated changing of the budget's leftower!
                self.makeChart()
                    .frame(width: 260, height: 260)
                    .onTapGesture {
                        self.animateChart = true
                        self.viewModel.vibrate()
                        self.player.playSound(for: .chart)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.animateChart = false
                        }
                    }
                
                /// Budget Information
                HorizontalBudgetBoardView(
                    showingAlert: self.$showingAlert,
                    isDetailCellViewPresented: self.$isDetailCellViewPresented,
                    animatedExpenses: self.animatedExpenses,
                    animatedBudget: self.animatedBudget
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
    
    // MARK: - Methods
    private func updateAnimatedValues() {
        self.animatedLeftover = self.leftover
        self.animatedBudget = self.budget
        self.animatedExpenses = self.expenses
    }
    
    private func playSound() {
        if self.leftover > self.animatedLeftover {
            self.player.playSound(for: .income)
        }
        if self.leftover < self.animatedLeftover {
            self.player.playSound(for: .expenses)
        }
    }
    
    // MARK: - Views
    /// Chart
    private func makeChart() -> some View {
        Gauge(
            value: self.viewModel.setLeftoverValueForChart(leftover: self.animatedLeftover),
            in: 0...self.animatedBudget
        ) {
        } currentValueLabel: {
            Text("LEFTOVER")
                .font(.title2)
                .fontDesign(.monospaced)
                .foregroundStyle(.white.opacity(0.8))
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

#Preview {
    HomeView()
}
