//
//  HomeView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 31.03.24.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    // MARK: - State -
    @ObservedObject var viewModel: HomeViewModel
    
    // MARK: - DataBase -
    /// TODO:  TEST
    /// ALL Records
    @FetchRequest(entity: Money.entity(), sortDescriptors: []) var moneyRecords: FetchedResults<Money>
    
    /// CURRENT MONTH Income
    var currentMonthRecordsFetchRequest = Money.fetchCurrentMonthRecords()
    var monthIncome: FetchedResults<Money> {
        currentMonthRecordsFetchRequest.wrappedValue
    }
    
    /// TODAY Records
    var todayRecordsFetchRequest = Money.fetchTodayRecords()
    var todayRecords: FetchedResults<Money> {
        todayRecordsFetchRequest.wrappedValue
    }
    
    /// TEST
    /// Adding new Changes to CoreData
    let sortTypes = [
        (name: "RecordTimestamp", descriptors: [SortDescriptor(\Money.timestamp, order: .forward)])
//        (name: "IsIncome", descriptors: [SortDescriptor(\Money.isIncome, order: .forward)])
    ]
    
    @State var activeSortIndex = 0
    
    // MARK: - Properties
    let infoBoardWidth = Constants.screenWidth / 2.8
    var expensesToday: String {
        return self.viewModel.calculateTodayExpenses(records: todayRecords)
    }
    var dailyBudget: String {
        self.viewModel.calculateDailyBudget(records: monthIncome)
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
                        self.viewModel.isMakeNewRecordViewPresented.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .font(Font.system(size: 36))
                            .foregroundStyle(.white)
                    })
                    .fullScreenCover(
                        isPresented: self.$viewModel.isMakeNewRecordViewPresented,
                        content: {
                            MakeNewMoneyRecordView(
                                viewModel: MakeNewMoneyRecordViewModel()
                            )
                        }
                    )
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
            .onChange(of: activeSortIndex) {
                todayRecords.sortDescriptors = sortTypes[activeSortIndex].descriptors
            }
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
                Text(self.expensesToday)
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
                Text(self.dailyBudget)
                    .font(.title2)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.white.opacity(0.8))
            }
            .frame(width: self.infoBoardWidth)
        }
        .onAppear {
            // TODO: - FOR TESTING -
            //            Money.deleteAllObjects(context: self.context)
            //            print("Today records: \(self.todayRecords)")
            //            print("ALL records: \(self.moneyRecords)")
        }
    }
    
    /// Chart
    func makeChart() -> some View {
        Gauge(
            value: self.viewModel.currentBalance,
            in: 0...self.viewModel.todayBudget
        ) {
        } currentValueLabel: {
            Text("\(self.viewModel.currentBalance, specifier: "%.2f")")
        }
        .gaugeStyle(ChartHalfDonut())
    }
}

#Preview {
    
    let context = PersistenceController.preview.container.viewContext
    let spentMoney = Money(context: context)
    spentMoney.moneyAmount = 323
    return HomeView(viewModel: HomeViewModel())
}
