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
    @State private var inputAmount = ""
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
                    .font(.title)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundStyle(Color.white)
                
                /// User Input Amount of Money
                HStack {
                    Spacer()
                    TextField("", text: $inputAmount)
                        .multilineTextAlignment(.trailing)
                        .font(.title)
                        .foregroundStyle(Color.clear)
                        .keyboardType(.decimalPad)
                        .focused(self.$isKeyboardFocused)
                        .background(.clear)
                        .padding(.vertical)
                        .onReceive(Just(inputAmount)) { _ in /// Input Length restriction
                            if inputAmount.count > 18 {
                                inputAmount = String(inputAmount.prefix(18))
                            }
                        }
                        .onChange(of: inputAmount) {
                            // Format the input amount as currency
                            if inputAmount.count > 2 {
                                displyedNumber = formatAmount(inputAmount)
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
    }
    
    // Function to format the amount as currency
    private func formatAmount(_ amountString: String) -> String {
        var formattedAmount = ""
        let decimalSeparator = Constants.decimalSeparator
        let groupingSeparator = Constants.groupingSeparator
        
        // Remove non-numeric characters
        let cleanAmount = amountString.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        
        // Add thousands separator
        let length = cleanAmount.count
        for i in 0..<length {
            if i > 0 && ((length - 2) - i) % 3 == 0 {
                formattedAmount += groupingSeparator
            }
            let index = cleanAmount.index(cleanAmount.startIndex, offsetBy: i)
            formattedAmount += String(cleanAmount[index]).reversed()
        }
        
        // Add decimal separator
        if length >= 3 {
            let index = formattedAmount.index(formattedAmount.endIndex, offsetBy: -2)
            formattedAmount.insert(contentsOf: decimalSeparator, at: index)
        }
        
        return formattedAmount
    }
}

#Preview {
    CurrencyTextFieldView(currency: "UAH")
}
