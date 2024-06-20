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
    private var viewModel = HomeViewModel()
    @State var isMakeNewRecordViewPresented = false
    
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
    
    // MARK: - Body
    var body: some View {
        ZStack {
            BackgroundGradView()
            VStack {
                /// Plus button
                HStack {
                    Spacer()
                    Button(action: {
                        self.isMakeNewRecordViewPresented.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .font(Font.system(size: 36))
                            .foregroundStyle(.white)
                    })
                    .fullScreenCover(
                        isPresented: self.$isMakeNewRecordViewPresented,
                        content: {
                            MakeNewMoneyRecordView(
                                viewModel: MakeNewMoneyRecordViewModel()
                            )
                        }
                    )
                }
                .padding(.trailing, 40)
                
                /// Chart View
                // TODO: - Add button or gesture over chart - to open detailed view!
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
        .onAppear {
        
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
                Text(self.viewModel.convertToString(intValue: self.expenses).formatAsCurrency())
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
                Text("\(String(describing: self.budget).formatAsCurrency())")
                    .font(.title2)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.white.opacity(0.8))
            }
            .frame(width: self.infoBoardWidth)
        }
    }
    
    /// Chart
    private func makeChart() -> some View {
        Gauge(
            value: self.leftover,
            in: 0...self.budget
        ) {
        } currentValueLabel: {
            Text("\(String(describing: self.leftover).formatAsCurrency())")
        }
        .gaugeStyle(ChartHalfDonut())
    }
}

#Preview {
    HomeView()
}
