//
//  CalendarDetailsView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 04.08.24.
//

import SwiftUI

struct CalendarDetailsView: View {
    // MARK: - Environment
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var viewContext
    
    // MARK: - State
    @State private var selectedDay: Date
    @State private var selectedRecordId: String = ""
    @StateObject private var viewModel = CalendarDetailsViewModel()
    @State private var showErrorAlert = false
    @State private var errorMessage = "Smth went wrong"
    @State private var showRecordEditor = false
    
    // MARK: - DB
    @FetchRequest private var records: FetchedResults<Money>
    
    // MARK: - Init
    init(selectedDay: Date) {
        self._selectedDay = State(initialValue: selectedDay)
        self._records = FetchRequest(
            entity: Money.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \Money.timestamp, ascending: true)],
            predicate: CoreDataManager.predicateForSelectedDay(date: selectedDay)
        )
    }
    
    // MARK: - Body
    var body: some View {
        ZStack {
            BackgroundGradView()
            self.content
                .padding(.top, 16)
                .foregroundStyle(.white)
        }
        .onAppear(perform: self.loadRecords)
        .alert(
            isPresented: self.$showErrorAlert,
            content: self.errorAlert
        )
        .onChange(of: self.selectedRecordId, {
            if !self.selectedRecordId.isEmpty {
                self.showRecordEditor = true
            }
        })
        .fullScreenCover(
            isPresented: self.$showRecordEditor,
            onDismiss: {
                self.selectedRecordId = ""
            },
            content: {
            EditRecordView(recordId: self.selectedRecordId)
        })
    }
    
    // MARK: - Views
    private var content: some View {
        VStack(spacing: 16) {
            CancelButtonView(action: { dismiss() })
            DateHeaderView(date: self.selectedDay)
            self.recordsList
            Spacer()
        }
    }
    
    private var recordsList: some View {
        List {
            if !self.viewModel.income.isEmpty {
                self.recordsSection(
                    title: "INCOME",
                    records: self.viewModel.income
                )
            }
            if !self.viewModel.expenses.isEmpty {
                self.recordsSection(
                    title: "EXPENSES",
                    records: self.viewModel.expenses
                )
            }
        }
        .scrollContentBackground(.hidden)
    }
    
    private func recordsSection(
        title: String,
        records: [MoneyModel]
    ) -> some View {
        
        Section(header: Text(title)
            .font(.customFont(style: .regular, size: .small))
            .opacity(0.9)) {
                
                ForEach(records) { record in
                    ZStack {
                        DetailCellView(
                            iconName: record.category.icon,
                            note: record.notes,
                            sum: record.moneyAmount,
                            category: record.category.moneyGroupType
                        )
                        
                        Rectangle()
                            .fill(.clear)
                            .contentShape(Rectangle())
                    }
                    .onTapGesture {
                        self.selectedRecordId = record.id
                    }
                    .listRowSeparatorTint(.white.opacity(0.3))
                }
                .onDelete { indexSet in
                    withAnimation {
                        self.deleteRecord(at: indexSet, from: title)
                    }
                }
            }
            .listRowBackground(Color.white.opacity(0.15))
        // TODO: - Change .listRowBackground to .lightBlue.opacity(0.4)
    }
    
    private func errorAlert() -> Alert {
        Alert(
            title: Text("ERROR")
                .font(.customFont(style: .medium, size: .body)),
            message: Text(errorMessage)
                .font(.customFont(style: .regular, size: .body)),
            dismissButton: .default(
                Text("OK")
                    .font(.customFont(style: .medium, size: .body))
            )
        )
    }
    
    // MARK: - Actions
    private func deleteRecord(at offsets: IndexSet, from section: String) {
        
        offsets.forEach { index in
            let record = section == "INCOME" ? self.viewModel.income[index] : self.viewModel.expenses[index]
            
            if let moneyObject = records.first(where: { $0.timestamp == record.timestamp }) {
                self.viewContext.delete(moneyObject)
            }
        }
        do {
            try self.viewContext.save()
            
        } catch {
            self.errorMessage = "Failed to delete record. Try again."
            print("Failed to delete record: \(error.localizedDescription)")
            self.showErrorAlert.toggle()
        }
        self.loadRecords()
    }
    
    // MARK: - Methods
    private func loadRecords() {
        self.viewModel.getIncomeRecords(records: records)
        self.viewModel.getExpensesRecords(records: records)
    }
}

#Preview {
    CalendarDetailsView(selectedDay: Date.now)
}
