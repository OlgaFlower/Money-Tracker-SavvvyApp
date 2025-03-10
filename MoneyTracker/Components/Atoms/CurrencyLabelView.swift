//
//  CurrencyLabelView.swift
//  Monika
//
//  Created by Olha Bereziuk on 10.03.25.
//

import SwiftUI

struct CurrencyLabelView: View {
    
    let currency: String
    
    var body: some View {
        Text(self.currency)
            .font(.largeTitle)
    }
}

#Preview {
    CurrencyLabelView(currency: "$")
}
