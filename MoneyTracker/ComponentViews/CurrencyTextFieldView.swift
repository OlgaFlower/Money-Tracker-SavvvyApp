//
//  CurrencyTextFieldView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 06.05.24.
//

import SwiftUI
import Combine

enum CurrencyTextfieldCase {
    case newRecord
    case editRecord
}

struct CurrencyTextFieldView: View {
    
    // MARK: - State -
    @FocusState var isKeyboardFocused: Bool
    @Binding var inputAmount: String
    @State private var displayedNumber: String
    
    // MARK: - Properties -
    let currency: String
    
    // MARK: - Init
    init(
        inputAmount: Binding<String>,
        currency: String,
        useCase: CurrencyTextfieldCase,
        isKeyboardFocused: FocusState<Bool>
    ) {
        self._inputAmount = inputAmount
        self._isKeyboardFocused = isKeyboardFocused
        self.currency = currency
        
        switch useCase {
        case .editRecord:
            self._displayedNumber = State(initialValue: inputAmount.wrappedValue)
        case .newRecord:
            self._displayedNumber = State(initialValue: TextFormatter.textToCurrency("000"))
        }
    }
    
    // MARK: - Body -
    var body: some View {
        VStack {
            ZStack {
                BackgroundRectangleView(heigt: 50)
                    .ignoresSafeArea()
                
                /// Displayed Number
                HStack {
                    Text("\(displayedNumber) \(currency)")
                        .multilineTextAlignment(.center)
                        .font(.customFont(style: .regular, size: .title))
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundStyle(Color.white)
                }
                /// User Input Amount of Money - hidden field
                HStack {
                    Spacer()
                    TextField("", text: $inputAmount)
                        .frame(width: 1)
                        .font(.customFont(style: .regular, size: .title))
                        .foregroundStyle(Color.clear)
                        .tint(.clear)
                        .keyboardType(.decimalPad)
                        .focused(self.$isKeyboardFocused)
                        .background(.clear)
                        .padding(.vertical)
                        .onReceive(Just(inputAmount)) { _ in /// Input Length restriction
                            if inputAmount.count > 15 {
                                inputAmount = String(inputAmount.prefix(15))
                            }
                        }
                        .onChange(of: self.inputAmount) {
                            self.formatAndUpdateCurrency()
                        }
                }
            }
        }
        .onTapGesture {
            self.isKeyboardFocused = true
        }
    }
    
    private func formatAndUpdateCurrency() {
        let cleanNumber = inputAmount.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        
        if cleanNumber.isEmpty {
            displayedNumber = TextFormatter.textToCurrency("000")
        } else {
            let paddedNumber = cleanNumber.padLeft(toLength: 3, withPad: "0")
            displayedNumber = TextFormatter.textToCurrency(paddedNumber)
        }
        
        /// Update inputAmount to the actual value
        if let doubleValue = Double(displayedNumber.replacingOccurrences(of: " ", with: "")) {
            inputAmount = String(format: "%.2f", doubleValue)
        } else {
            inputAmount = "0.00"
        }
    }
}
