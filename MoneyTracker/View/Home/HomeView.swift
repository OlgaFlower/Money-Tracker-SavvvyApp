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
    @StateObject var player = AudioPlayer()
    @State var isMakeNewRecordViewPresented = false
    @State var isDetailCellViewPresented = false
    @State var animateChart = false
    @State private var animatedLeftover: Double = 0.0
    @State private var animatedBudget: Double = 0.0
    @State private var animatedExpenses: Int = 0
    
    // MARK: - DB
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
    
    // MARK: - Properties
    private var viewModel = HomeViewModel()
    private let infoBoardWidth = Constants.screenWidth / 2.8
    
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
                self.budgetInformationView
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
    private var budgetInformationView: some View {
        HStack {
            VStack(spacing: 18) {
                HStack {
                    Spacer()
                    Text("SPENT")
                        .font(.title2)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.white.opacity(0.8))
                }
                .padding(.trailing, 30)
                
                // TODO: - Animated changing of the spent sum!
                HStack {
                    Spacer()
                    Text(self.viewModel.convertToString(intValue: self.animatedExpenses).formatAsCurrency())
                        .font(.title2)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.white.opacity(0.8))
                        .contentTransition(.numericText())
                        .animation(.linear, value: self.animatedExpenses)
                }
                .padding(.trailing, 16)
            }
            .frame(width: self.infoBoardWidth)
            .onTapGesture {
                self.viewModel.vibrateLight()
                self.isDetailCellViewPresented = true
            }
            .sheet(isPresented: self.$isDetailCellViewPresented, content: {
                ExpensesDetailView()
            })
            
            Rectangle()
                .frame(width: 1, height: 80)
                .foregroundStyle(.white.opacity(0.3))
                .padding(.horizontal, 12)
            
            VStack(spacing: 18) {
                HStack {
                    Text("BUDGET")
                        .font(.title2)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.white.opacity(0.8))
                    Spacer()
                }
                .padding(.leading, 30)
                
                // TODO: - Animated changing of the budget sum!
                HStack {
                    Text(String(describing: self.animatedBudget).formatAsCurrency())
                        .font(.title2)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.white.opacity(0.8))
                        .contentTransition(.numericText())
                        .animation(.linear, value: self.animatedBudget)
                    Spacer()
                }
                .padding(.leading, 30)
            }
            .frame(width: self.infoBoardWidth)
            .onTapGesture {
                self.viewModel.vibrateLight()
            }
        }
    }
    
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
