//
//  BorderedTextInputView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 02.11.24.
//

import SwiftUI

struct BorderedTextInputView: View {
    
    @Binding var input: String
    var placeholder: String
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            
            RoundedRectangle(cornerRadius: 10)
                .stroke(
                    .white.opacity(0.8),
                    lineWidth: 0.5
                )
                .frame(height: 50)
            
            if input.isEmpty {
                Text(placeholder.uppercased())
                    .foregroundStyle(.white.opacity(self.input.isEmpty ?  0.3 : 0))
                    .padding(.leading, 32)
            }
            TextField("", text: self.$input)
                .textInputAutocapitalization(.characters)
                .textCase(.uppercase)
                .foregroundStyle(.white.opacity(0.8))
                .padding(.leading, 32)
        }
    }
}

#Preview {
    BorderedTextInputView(
        input: .constant(""),
        placeholder: "your country name"
    )
}
