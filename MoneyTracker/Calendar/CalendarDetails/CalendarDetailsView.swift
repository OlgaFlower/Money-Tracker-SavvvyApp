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
            
                VStack(spacing: 32) {
                    self.cancelButton
                        .padding(.horizontal, 24)
                    
                    self.titleView
                    
                    List {
                        if !self.viewModel.income.isEmpty {
                            Section {
                                ForEach(self.viewModel.income) { record in
                                    DetailCellView(
                                        iconName: record.category.icon,
                                        note: record.notes,
                                        sum: record.moneyAmount
                                    )
                                }
                            }
                            .listRowBackground(Color.white.opacity(0.15))
                        }
                        
                        if !self.viewModel.expenses.isEmpty {
                            Section {
                                ForEach(self.viewModel.expenses) { record in
                                    DetailCellView(
                                        iconName: record.category.icon,
                                        note: record.notes,
                                        sum: record.moneyAmount
                                    )
                                }
                            }
                            .listRowBackground(Color.white.opacity(0.15))
                        }
                    }
                    .scrollContentBackground(.hidden)
                    
                    Spacer()
                }
                .foregroundStyle(.white)
                .padding(.top, 32)
        }
        .onAppear {
            self.viewModel.getIncomeRecords(records: self.records)
            self.viewModel.getExpensesRecords(records: self.records)
        }
    }
    
    // MARK: - Views
    /// CANCEL
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
    /// TITLE
    private var titleView: some View {
        Text(selectedDate.formattedDayMonthYear().uppercased())
            .font(.customFont(style: .semibold, size: .body))
            .opacity(0.8)
    }
}

#Preview {
    CalendarDetailsView(selectedDate: .constant(Date.now))
}
