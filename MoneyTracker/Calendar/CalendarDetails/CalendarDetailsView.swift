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
    @Binding var selectedDate: Date
    @StateObject private var viewModel = CalendarDetailsViewModel()
    
    // MARK: - DB
    @FetchRequest private var records: FetchedResults<Money>
    
    // MARK: - Init
    init(selectedDate: Binding<Date>) {
        self._selectedDate = selectedDate
        self._records = FetchRequest(
            entity: Money.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \Money.timestamp, ascending: true)],
            predicate: CoreDataManager.predicateForSelectedDay(date: selectedDate.wrappedValue)
        )
    }
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            BackgroundGradView()
            self.content
                .padding(.top, 32)
                .foregroundStyle(.white)
        }
        .onAppear {
            self.viewModel.getIncomeRecords(records: self.records)
            self.viewModel.getExpensesRecords(records: self.records)
        }
    }
    
    // MARK: - Views
    private var content: some View {
        
        VStack(spacing: 32) {
            self.cancelButton
                .padding(.horizontal, 24)
            self.titleView
                .padding(.horizontal, 16)
            self.recordsList
            Spacer()
        }
    }
    
    private var cancelButton: some View {
        
        HStack {
            Spacer()
            Button(action: {
                Constants.vibrateLight()
                self.dismiss()
            }, label: {
                Image(systemName: "plus")
                    .font(Font.system(size: 28))
                    .opacity(0.8)
                    .rotationEffect(.degrees(45))
            })
        }
    }
    
    private var titleView: some View {
        
        HStack {
            Text(self.selectedDate.formattedDayMonthYear().uppercased())
                .font(.customFont(style: .medium, size: .title))
                .opacity(0.8)
            Spacer()
        }
    }
    
    private var recordsList: some View {
        
        List {
            if !self.viewModel.income.isEmpty {
                self.recordsSection(title: "INCOME", records: self.viewModel.income)
            }
            if !self.viewModel.expenses.isEmpty {
                self.recordsSection(title: "EXPENSES", records: self.viewModel.expenses)
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
            .opacity(0.8)) {
                
                ForEach(records) { record in
                    DetailCellView(
                        iconName: record.category.icon,
                        note: record.notes,
                        sum: record.moneyAmount,
                        category: record.category.moneyGroupType
                    )
                    .listRowSeparatorTint(.white.opacity(0.2))
                }
            }
            .listRowBackground(Color.white.opacity(0.15))
    }
}

#Preview {
    CalendarDetailsView(selectedDate: .constant(Date.now))
}
