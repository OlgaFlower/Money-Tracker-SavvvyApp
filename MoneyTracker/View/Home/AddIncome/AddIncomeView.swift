//
//  AddIncomeView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 04.04.24.
//

import SwiftUI

struct AddIncomeView: View {
    // MARK: - Properties
    @Environment(\.dismiss) var dismiss
    let currency = Country.euro.currencySymbol // TODO: - add from user data
    
    // MARK: - Body
    var body: some View {
        
        
        
        NavigationView {
            Form {
                /// REGULAR INCOME
                Section {
                    ForEach(IncomeTypes.shared.incomeRegular) { income in
                        NavigationLink(
                            destination: AddIncomeDetailedView(
                                viewModel: AddIncomeDetailedViewModel(selectedIncomeType: income)
                            )
                        ) {
                            if let income = income.incomeRegular {
                                self.makeIncomeRow(icon: income.icon, title: income.title)
                            }
                        }
                    }
                } header: {
                    Text("REGULAR INCOME")
                }
                
                /// TEMPORARY INCOME
                Section {
                    ForEach(IncomeTypes.shared.incomeTemporary) { income in
                        NavigationLink(
                            destination: AddIncomeDetailedView(
                                viewModel: AddIncomeDetailedViewModel(selectedIncomeType: income)
                            )
                        ) {
                            if let income = income.incomeTemporary {
                                self.makeIncomeRow(icon: income.icon, title: income.title)
                            }
                        }
                    }
                } header: {
                    Text("TEMPORARY INCOME")
                }
            }
            .navigationTitle("Income")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(
                trailing:
                    Button("Cancel") {
                        dismiss()
                    }
            )
        }
    }
    
    // MARK: - Views
    func makeIncomeRow(icon: String, title: String) -> some View {
        HStack {
            Image(systemName: icon)
            Text(title)
            Spacer()
        }
    }
}

// MARK: - Preview
#Preview {
    AddIncomeView()
}
