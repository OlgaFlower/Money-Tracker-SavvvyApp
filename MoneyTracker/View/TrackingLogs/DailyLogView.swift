//
//  DailyLogView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 29.03.24.
//

import SwiftUI

struct DailyLogView: View {
    
    let moneyData = [
        MoneyModel(recordType: .income, icon: "gym.bag", title: "Salary", sum: "3000", description: nil),
        MoneyModel(recordType: .expenses, icon: "cart", title: "Zara", sum: "156", description: nil),
        MoneyModel(recordType: .expenses, icon: "cross.case", title: "Medicines", sum: "34.87", description: "Drops for eyes rfer erfger verger ergverb  ervgerb ebergve erf."),
        MoneyModel(recordType: .expenses, icon: "heart", title: "Flowers", sum: "9", description: nil),
        MoneyModel(recordType: .expenses, icon: "carrot", title: "Groceries, Rewe", sum: "119.76", description: nil),
        MoneyModel(recordType: .expenses, icon: "figure.strengthtraining.traditional", title: "Gym", sum: "53", description: nil),
        MoneyModel(recordType: .expenses, icon: "lightrail", title: "DB Ticket", sum: "49", description: nil)
    ]
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.mainNavy.opacity(0.02))
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                makeList()
            }
            .padding(.horizontal, 24)
        }
    }
    
    private func makeList() -> some View {
        ForEach(moneyData) { record in
            LogItemView(record: record)
        }
    }
}

#Preview {
    BankAccountsView(viewModel: BankAccountsViewModel())
}
