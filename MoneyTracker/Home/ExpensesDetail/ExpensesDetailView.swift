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
    @State private var itemDeleted = false
    
    // MARK: - Properties
    var updateAnimatedValues: () -> Void
    
    // MARK: - DB
    var todayExpensesFetchRequest = CoreDataManager.fetchExpensesForDay(date: Date())
    private var expensesRecords: FetchedResults<Money> {
        todayExpensesFetchRequest.wrappedValue
    }
    
    // MARK: - Body
    var body: some View {
        ZStack {
            BackgroundGradView()
            VStack {
                self.headerView
                self.expensesListView
            }
            .foregroundStyle(.white)
            .padding(.top, 28)
        }
        .onAppear {
            self.viewModel.loadExpenses(records: self.expensesRecords)
        }
        .onDisappear {
            self.handleOnDisappear()
        }
    }
    
    // MARK: - Views
    private var headerView: some View {
        HStack {
            Text("EXPENSES TODAY")
                .font(.customFont(style: .medium, size: .body))
                .padding(.leading, 16)
                .padding(.top)
            Spacer()
        }
    }
    
    private var expensesListView: some View {
        List {
            self.expensesSection(
                title: "GENERAL EXPENSES",
                expenses: self.$viewModel.generalExpenses,
                deleteAction: self.deleteGeneralItem
            )
            self.expensesSection(
                title: "RECURRING EXPENSES",
                expenses: self.$viewModel.recurringExpenses,
                deleteAction: self.deleteRecurringItem
            )
        }
        .scrollContentBackground(.hidden)
    }
    
    @ViewBuilder
    private func expensesSection(
        title: String,
        expenses: Binding<[MoneyModel]>,
        deleteAction: @escaping (IndexSet) -> Void
    ) -> some View {
        
        if !expenses.wrappedValue.isEmpty {
            Section(
                header: Text(title)
                    .font(.customFont(style: .regular, size: .small))
                    .opacity(0.8)
            ) {
                ForEach(expenses.wrappedValue) { record in
                    DetailCellView(
                        iconName: record.category.icon,
                        note: record.notes,
                        sum: record.moneyAmount,
                        category: record.category.moneyGroupType
                    )
                    .listRowSeparatorTint(.white.opacity(0.2))
                }
                .onDelete(perform: deleteAction)
            }
            .listRowBackground(Color.white.opacity(0.15))
        }
    }
    
    // MARK: - Actions
    private func handleOnDisappear() {
        if self.itemDeleted {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.updateAnimatedValues()
            }
        }
    }
    
    private func deleteGeneralItem(offsets: IndexSet) {
        self.deleteItems(
            at: offsets,
            from: &viewModel.generalExpenses
        )
    }
    
    private func deleteRecurringItem(offsets: IndexSet) {
        self.deleteItems(
            at: offsets,
            from: &viewModel.recurringExpenses
        )
    }
    
    private func deleteItems(
        at offsets: IndexSet,
        from expenses: inout [MoneyModel]
    ) {
        for index in offsets {
            viewContext.delete(self.expensesRecords[index])
        }
        expenses.remove(atOffsets: offsets)
        try? viewContext.save()
        self.itemDeleted = true
    }
}

#Preview {
    ExpensesDetailView(updateAnimatedValues: {})
}
