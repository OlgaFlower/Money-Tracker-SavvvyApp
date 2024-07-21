//
//  ExpensesDetailView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 25.06.24.
//

import SwiftUI

struct ExpensesDetailView: View {
    // MARK: - State
    @Environment(\.managedObjectContext) var viewContext
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
                    Text("EXPENSES TODAY")
                        .font(.customFont(style: .medium, size: .body))
                        .padding(.leading, 16)
                        .padding(.top)
                    Spacer()
                }
                List {
                    Section {
                        ForEach(self.viewModel.expenses) { record in
                            DetailCellView(
                                iconName: record.category.icon,
                                note: record.notes,
                                sum: record.moneyAmount
                            )
                        }
                        .onDelete(perform: self.deleteItem)
                    }
                    .listRowBackground(Color.white.opacity(0.15))
                }
                .scrollContentBackground(.hidden)
            }
            .foregroundStyle(.white)
            .padding(.top, 28)
        }
        .onAppear {
            self.viewModel.getExpenses(records: self.todayRecords)
        }
    }
    
    private func deleteItem(offsets: IndexSet) {
        self.viewModel.expenses.remove(atOffsets: offsets)
        
        for item in offsets {
            self.viewContext.delete(self.todayRecords[item])
        }
        try? self.viewContext.save()
    }
}

#Preview {
    ExpensesDetailView()
}
