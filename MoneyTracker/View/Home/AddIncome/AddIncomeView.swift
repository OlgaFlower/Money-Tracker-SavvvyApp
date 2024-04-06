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
                Section {
                    NavigationLink(destination: AddExpenseDetailView()) {
                        self.makeIncomeRow(icon: "heart.circle", title: "Salary")
                    }
                    NavigationLink(destination: AddExpenseDetailView()) {
                        self.makeIncomeRow(icon: "cross.case.circle", title: "Pension")
                    }
                    NavigationLink(destination: AddExpenseDetailView()) {
                        self.makeIncomeRow(icon: "bubbles.and.sparkles", title: "Bonus")
                    }
                } header: {
                    Text("STABLE INCOME")
                }
                
                Section {
                    NavigationLink(destination: AddExpenseDetailView()) {
                        self.makeIncomeRow(icon: "homekit", title: "Rent")
                    }
                    NavigationLink(destination: AddExpenseDetailView()) {
                        self.makeIncomeRow(icon: "lightbulb.max", title: "Bonus")
                    }
                    NavigationLink(destination: AddExpenseDetailView()) {
                        self.makeIncomeRow(icon: "figure.equestrian.sports", title: "Stocks")
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
    
    private func makeIncomeRow(icon: String, title: String) -> some View {
        HStack {
            Image(systemName: icon)
            Text(title)
            Spacer()
        }
    }
}

#Preview {
    AddIncomeView()
}
