//
//  CurrencyInputView.swift
//  Monika
//
//  Created by Olha Bereziuk on 10.03.25.
//

import SwiftUI

struct CurrencyInputView: View {
    
    @FocusState private var isKeyboardFocused: Bool
    @Binding var inputAmount: String
    @State private var displayedNumber: String
    let currency: String
    
    init(
        inputAmount: Binding<String>,
        currency: String,
        useCase: TextfieldInputCase
    ) {
        self._inputAmount = inputAmount
        self.currency = currency
        switch useCase {
        case .editRecord:
            self._displayedNumber = State(initialValue: TextFormatter.textToCurrency(inputAmount.wrappedValue))
        case .newRecord:
            self._displayedNumber = State(initialValue: TextFormatter.textToCurrency("000"))
        }
    }
    
    var body: some View {
        VStack {
            ZStack {
                FormattedMoneyAmountView(
                    displayedNumber: self.displayedNumber,
                    currency: self.currency
                )
                UserInputMoneyAmountView(
                    inputAmount: $inputAmount,
                    isKeyboardFocused: _isKeyboardFocused,
                    formatAndUpdate: self.formatAndUpdateCurrency
                )
            }
        }
        .onTapGesture {
            self.isKeyboardFocused = true
        }
    }
    
    private func formatAndUpdateCurrency() {
        let cleanNumber = self.inputAmount.replacingOccurrences(
            of: "[^0-9]",
            with: "",
            options: .regularExpression
        )
        
        if cleanNumber.isEmpty {
            self.displayedNumber = TextFormatter.textToCurrency("000")
        } else {
            let paddedNumber = cleanNumber.padLeft(toLength: 3, withPad: "0")
            self.displayedNumber = TextFormatter.textToCurrency(paddedNumber)
        }
    }
}

#Preview {
    CurrencyInputView(
        inputAmount: .constant("765345"),
        currency: "$",
        useCase: .newRecord
    )
}
