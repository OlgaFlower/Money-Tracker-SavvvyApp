//
//  UserInputMoneyAmountView.swift
//  Monika
//
//  Created by Olha Bereziuk on 10.03.25.
//

import SwiftUI

struct UserInputMoneyAmountView: View {
    
    @Binding var inputAmount: String
    @FocusState var isKeyboardFocused: Bool
    let formatAndUpdate: () -> Void
    
    var body: some View {
        HStack {
            Spacer()
            CurrencyHiddenTextfieldView(
                inputAmount: $inputAmount,
                isKeyboardFocused: _isKeyboardFocused
            )
                .onChange(of: inputAmount) {
                    formatAndUpdate()
                }
        }
    }
}

#Preview {
    UserInputMoneyAmountView(
        inputAmount: .constant("34556"),
        formatAndUpdate: {}
    )
}
