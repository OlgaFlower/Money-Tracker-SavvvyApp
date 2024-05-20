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
    /// TODAY Records
    var todayRecordsFetchRequest = Money.fetchTodayRecords()
    var todayRecords: FetchedResults<Money> {
        todayRecordsFetchRequest.wrappedValue
    }
    
    // MARK: - Properties
     let infoBoardWidth = Constants.screenWidth / 2.8
     var spentMoneyToday: String {
         return self.viewModel.calculateSpentMoneyToday(records: todayRecords)
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
                                viewModel: MakeNewMoneyRecordViewModel(),
                                isPresented: self.$viewModel.isMakeNewRecordViewPresented
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
                Text(String(describing: self.spentMoneyToday))
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
        .onAppear {
            // TODO: - FOR TESTING -
//            Money.deleteAllObjects(context: self.context)
            print("Today records: \(self.todayRecords)")
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
