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
            VStack {
                
                DropDownMenuView()
                    .padding(.top, 24)
                Spacer()
            }
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
