//
//  HomeView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 31.03.24.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - State -
    @State private var currentBalance: Double = 28.61
    @State private var isChangeBudgetViewShowing = false
    @State private var spentMoneyToday: Decimal = 0.0
    
    // MARK: - Properties
    private let minValue: Double = 0.00
    private var dayBudget: Double = 465.00
    private let infoBoardWidth = Constants.screenWidth / 2.8
    
    // MARK: - DataBase -
    private let moneyFetchRequest = Money.basicFetchRequest()
    var moneyRecords: FetchedResults<Money> {
        moneyFetchRequest.wrappedValue
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
    }
    
    /// Chart
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
    
    
    func calculateSpentMoneyToday() {
        var intValues: [Int] = moneyRecords.compactMap { Int($0.moneyAmount) }
        print("Int: \(intValues)")
        var decimalValues: [Decimal] = intValues.map { Decimal($0/100) }
        print("Decimal: \(decimalValues)")
        self.spentMoneyToday = sumOfDecimals(decimalValues)
    }
    
    func sumOfDecimals(_ decimals: [Decimal]) -> Decimal {
        return decimals.reduce(0, +)
    }
}

#Preview {
    let context = PersistenceController.preview.container.viewContext
    let spentMoney = Money(context: context)
    spentMoney.moneyAmount = "3245"
    return HomeView()
}
