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
            .onChange(of: inputAmount) { _, newValue in
                // Remove any non-digit characters.
                let cleanNumber = newValue.replacingOccurrences(
                    of: "[^0-9]",
                    with: "",
                    options: .regularExpression
                )
                // If the first (and only) digit is "0", clear the input.
                if cleanNumber.count == 1 && cleanNumber == "0" {
                    inputAmount = ""
                } else {
                    formatAndUpdate()
                }
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
