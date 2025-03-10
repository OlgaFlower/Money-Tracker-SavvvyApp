//
//  CurrencyTextView.swift
//  Monika
//
//  Created by Olha Bereziuk on 10.03.25.
//

import SwiftUI

struct CurrencyTextView: View {
    
    let text: String
    
    var body: some View {
        Text(self.text)
            .multilineTextAlignment(.center)
            .font(.largeTitle)
    }
}

#Preview {
    CurrencyTextView(text: "97865")
}
