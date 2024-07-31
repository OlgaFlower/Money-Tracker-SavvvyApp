//
//  CurrencyTextFieldView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 06.05.24.
//

import SwiftUI
import Combine

struct CurrencyTextFieldView: View {
    
    // MARK: - State -
    @FocusState var isKeyboardFocused: Bool
    @Binding var inputAmount: String
    @State private var displyedNumber = "0,00"
    
    // MARK: - Properties -
    let currency: String
    
    // MARK: - Body -
    var body: some View {
        VStack {
            ZStack {
                /// Background
                Rectangle()
                    .foregroundStyle(Color.lightBlue.opacity(0.4))
                    .ignoresSafeArea()
                    .frame(height: 50)
                
                /// Displayed Number
                Text("\(displyedNumber) \(currency)")
                    .multilineTextAlignment(.center)
                    .font(.customFont(style: .regular, size: .title))
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundStyle(Color.white)
                
                /// User Input Amount of Money
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
                                displyedNumber = TextFormatter.textToCurrency(inputAmount)
                            }
                            if inputAmount.isEmpty {
                                displyedNumber = "0\(Constants.decimalSeparator)00"
                            }
                            if inputAmount.count == 1 {
                                displyedNumber = "0\(Constants.decimalSeparator)0\(inputAmount)"
                            }
                            if inputAmount.count == 2 {
                                displyedNumber = "0\(Constants.decimalSeparator)\(inputAmount)"
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

#Preview {
    CurrencyTextFieldView(inputAmount: .constant("0,00"), currency: "EUR")
}
