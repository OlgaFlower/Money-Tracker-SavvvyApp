//
//  AddIncomeDetailedView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 04.04.24.
//

import SwiftUI

struct AddIncomeDetailedView: View {
    // MARK: - Properties
    
    @ObservedObject var viewModel: AddIncomeDetailedViewModel
    @State private var incomeValue: String = "0,00"
    @State private var incomeName: String = ""
    
    // MARK: - Body
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                TextField("", text: self.$incomeValue)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.mainNavy)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(.mainNavy.opacity(0.03))
                    .clipShape(.rect(cornerRadius: 8, style: .continuous))
                Text("currency")
                    .font(.title)
                    .fontWeight(.semibold)
            }
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(.mainNavy.opacity(0.4), lineWidth: 1)
                        .frame(width: 50, height: 50)
                        
                    Image(systemName: "bag.badge.plus")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                
                TextField("Icome Title", text: self.$incomeName)
                .font(.title2)
                .foregroundStyle(.mainNavy)
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.top, 100)
    }
}

// MARK: - Preview
//#Preview {
//    AddIncomeDetailedView(incomeTitle: "Salary", currency: Country.euro.currencySymbol)
//}
