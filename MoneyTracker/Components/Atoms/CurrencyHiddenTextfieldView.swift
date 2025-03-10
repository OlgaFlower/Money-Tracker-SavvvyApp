//
//  CurrencyHiddenTextfieldView.swift
//  Monika
//
//  Created by Olha Bereziuk on 10.03.25.
//

import SwiftUI
import Combine

struct CurrencyHiddenTextfieldView: View {
    
    @Binding var inputAmount: String
    @FocusState var isKeyboardFocused: Bool
    
    var body: some View {
        TextField("", text: $inputAmount)
            .frame(width: 1)
            .font(.largeTitle)
            .foregroundStyle(Color.clear)
            .tint(.clear)
            .keyboardType(.decimalPad)
            .focused($isKeyboardFocused)
            .background(.clear)
            .padding(.vertical)
            .onReceive(Just(inputAmount)) { _ in
                if inputAmount.count > 15 {
                    inputAmount = String(inputAmount.prefix(15))
                }
            }
    }
}

#Preview {
    CurrencyHiddenTextfieldView(inputAmount: .constant("76765"))
}
