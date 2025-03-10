//
//  FormattedMoneyAmountView.swift
//  Monika
//
//  Created by Olha Bereziuk on 10.03.25.
//

import SwiftUI

struct FormattedMoneyAmountView: View {
    
    let displayedNumber: String
    let currency: String
    
    var body: some View {
        HStack {
            CurrencyTextView(text: displayedNumber)
            CurrencyLabelView(currency: currency)
        }
    }
}

#Preview {
    FormattedMoneyAmountView(
        displayedNumber: "232423",
        currency: "$"
    )
}
