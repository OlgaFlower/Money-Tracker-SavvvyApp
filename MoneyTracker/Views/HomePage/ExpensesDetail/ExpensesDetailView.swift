//
//  ExpensesDetailView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 25.06.24.
//

import SwiftUI

struct ExpensesDetailView: View {
    
    @StateObject private var viewModel = ExpensesDetailViewModel()
    
    // MARK: - DB
    /// Today Records
    private var todayRecordsFetchRequest = CoreDataManager.fetchTodayRecords()
    private var todayRecords: FetchedResults<Money> {
        todayRecordsFetchRequest.wrappedValue
    }
    
    // MARK: - Body
    var body: some View {
        ZStack {
            BackgroundGradView()
            VStack {
                HStack {
                    Text("Expenses")
                        .font(.system(size: 32, weight: .bold))
                        .padding(.leading, 16)
                        .padding(.vertical)
                    Spacer()
                }
                ScrollView {
                    ForEach(self.viewModel.expenses) { record in
                        DetailCellView(
                            iconName: record.category.icon,
                            note: record.notes,
                            sum: record.moneyAmount
                        )
                    }
                }
            }
            .foregroundStyle(.white)
            .padding(.top, 38)
        }
        .onAppear {
            self.viewModel.getExpenses(records: self.todayRecords)
        }
    }
}

#Preview {
    ExpensesDetailView()
}
