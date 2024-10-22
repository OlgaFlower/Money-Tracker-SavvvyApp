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
            self._displayedNumber = State(initialValue: "0 ,00")
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
                /// User Input Amount of Money - not visible
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
                        .onChange(of: inputAmount) {
                            // Format the input amount as currency
                            if inputAmount.count > 2 {
                                displayedNumber = TextFormatter.textToCurrency(inputAmount)
                            }
                            if inputAmount.isEmpty {
                                displayedNumber = "0 \(Constants.decimalSeparator)00"
                            }
                            if inputAmount.count == 1 {
                                displayedNumber = "0 \(Constants.decimalSeparator)0\(inputAmount)"
                            }
                            if inputAmount.count == 2 {
                                displayedNumber = "0 \(Constants.decimalSeparator)\(inputAmount)"
                            }
                        }
                }
            }
        }
        .onTapGesture {
            self.isKeyboardFocused = true
        }
    }
}
