//
//  AddBudgetChangeView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 04.04.24.
//

import SwiftUI

struct AddBudgetChangeView: View {
    // MARK: - Properties
    @Environment(\.dismiss) var dismiss
    @State var incomeValue: String = "0,00"
    let currency = Country.euro.currencySymbol // TODO: - add from user data
    
    // MARK: - Body
    var body: some View {
        ZStack {
            BackgroundGradView()
            VStack(spacing: 35) {
                HStack {
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.title)
                    Spacer()
                }
                
                self.recordTypeView
                .padding(.horizontal, 45)
                
                TextField("", text: self.$incomeValue)
                    .textFieldStyle(.plain)
                    .padding(.horizontal, 45)
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 32))
                    .padding(.vertical, 8)
                    .border(.white, width: 0.2).clipShape(.capsule)
                
                Spacer()
            }
            .padding(.top, 24)
            .padding(.horizontal, 16)
        }
    }
    
    private var recordTypeView: some View {
        HStack {
            Button(action: {
                print("REGULAR")
            }, label: {
                Text("REGULAR")
            })
            Spacer()
            
            Button(action: {
                print("TEMPORARY")
            }, label: {
                Text("TEMPORARY")
            })
        }
    }
}

extension AddBudgetChangeView {
    
    enum IncomeType {
        case regular
        case temporary
    }
}

// MARK: - Preview
#Preview {
    AddBudgetChangeView()
}
