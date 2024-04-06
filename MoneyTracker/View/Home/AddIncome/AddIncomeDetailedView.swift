//
//  AddIncomeDetailedView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 04.04.24.
//

import SwiftUI

struct AddIncomeDetailedView: View {
    // MARK: - Properties
    var incomeTitle: String
    @State private var incomeValue: String = "0,00"
    @State private var manuallyNamedIncome: String = ""
    
    // MARK: - Body
    var body: some View {
        VStack {
            TextField("", text: self.$incomeValue)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.mainNavy)
                .keyboardType(.numberPad)
                .padding(.vertical, 10)
                .padding(.horizontal, 15)
                .background(.mainNavy.opacity(0.03))
                .clipShape(.rect(cornerRadius: 8, style: .continuous))
            
            HStack {
                ZStack {
                    Rectangle()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.green.opacity(0.4))
                    Image(systemName: "bag.badge.plus")
                        .resizable()
                        .frame(width: 28, height: 28)
                }
                
                TextField(self.incomeTitle, text: self.$manuallyNamedIncome)
            }
            Spacer()
        }
        .padding(.horizontal, 12)
        .padding(.top, 100)
    }
}

// MARK: - Preview
#Preview {
    AddIncomeDetailedView(incomeTitle: "Salary")
}
