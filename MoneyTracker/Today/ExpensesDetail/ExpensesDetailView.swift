//
//  ExpensesDetailView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 25.06.24.
//

import SwiftUI
import CoreData

struct ExpensesDetailView: View {
    
    // MARK: - Environment
    @Environment(\.managedObjectContext) var viewContext
    
    // MARK: - State
    @StateObject private var viewModel = ExpensesDetailViewModel()
    @State private var itemDeleted = false
    @Binding var needToUpdateValues: Bool
    
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
        .onDisappear {
            self.handleOnDisappear()
        }
    }
    
    // MARK: - Views
    private var headerView: some View {
        HStack {
            TextHeaderView(text: "TODAY EXPENSES")
            Spacer()
        }
    }
    
    private var expensesListView: some View {
        List {
            self.expensesSection(
                title: "GENERAL",
                expenses: self.$viewModel.generalExpenses,
                deleteAction: self.deleteGeneralItem
            )
            self.expensesSection(
                title: "RECURRING",
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
                    .opacity(0.9)
            ) {
                ForEach(expenses.wrappedValue) { record in
                    DetailCellView(
                        iconName: record.category.icon,
                        note: record.notes,
                        sum: record.moneyAmount,
                        category: record.category.moneyGroupType
                    )
                    .listRowSeparatorTint(.white.opacity(0.3))
                }
                .onDelete(perform: deleteAction)
            }
            .listRowBackground(Color.lightBlue.opacity(0.4))
        }
    }
    
    // MARK: - Actions
    private func handleOnDisappear() {
        if self.itemDeleted {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.needToUpdateValues = self.itemDeleted
            }
        }
    }
    
    private func deleteGeneralItem(offsets: IndexSet) {
        CoreDataManager.shared.deleteRecord(at: offsets, from: &viewModel.generalExpenses, in: viewContext)
        self.itemDeleted = true 
        /// not .toggle because 2 and more items can be deleted
    }
    
    private func deleteRecurringItem(offsets: IndexSet) {
        CoreDataManager.shared.deleteRecord(at: offsets, from: &viewModel.recurringExpenses, in: viewContext)
        self.itemDeleted = true
    }
}

#Preview {
    ExpensesDetailView(needToUpdateValues: .constant(false))
}
