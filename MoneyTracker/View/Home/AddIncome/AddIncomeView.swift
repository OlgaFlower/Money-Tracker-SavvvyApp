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
    @State var incomeType: IncomeType = .regular
    @State var incomeValue: String = "0.00"
    let currency = Country.euro.currencySymbol // TODO: - add from user data
    
    // MARK: - Body
    var body: some View {
        ZStack {
            BackgroundGradView()
            VStack(spacing: 35) {
                
                self.incomeTypeView
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
    
    private var incomeTypeView: some View {
        HStack {
            Button(action: {
                print("REGULAR")
            }, label: {
                Text("REGULAR")
                    .opacity(self.incomeType == .regular ? 1.0 : 0.5)
            })
            Spacer()
            
            Button(action: {
                print("TEMPORARY")
            }, label: {
                Text("TEMPORARY")
                    .opacity(self.incomeType == .temporary ? 1.0 : 0.5)
            })
        }
    }
}

extension AddIncomeView {
    
    enum IncomeType {
        case regular
        case temporary
    }
}

// MARK: - Preview
#Preview {
    AddIncomeView()
}
