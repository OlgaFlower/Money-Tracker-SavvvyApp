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
    @State var selectedIcome: String = ""
    
    // MARK: - Body
    var body: some View {
        
        NavigationView {
            Form {
                /// REGULAR INCOME
                Section {
                    ForEach(Income.shared.incomeRegular) { income in
                        NavigationLink(destination: AddIncomeDetailedView(incomeTitle: income.title)) {
                            self.makeIncomeRow(icon: income.icon, title: income.title)
                        }
                    }
                } header: {
                    Text("REGULAR INCOME")
                }
                
                /// TEMPORARY INCOME
                Section {
                    ForEach(Income.shared.incomeTemporary) { income in
                        NavigationLink(destination: AddIncomeDetailedView(incomeTitle: income.title)) {
                            self.makeIncomeRow(icon: income.icon, title: income.title)
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
    private func makeIncomeRow(icon: String, title: String) -> some View {
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
