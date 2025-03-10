//
//  TextFieldView.swift
//  Savvvy
//
//  Created by Olha Bereziuk on 07.03.25.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var text: String
    @FocusState private var isKeyboardActive: Bool
    
    var body: some View {
        TextField("Add more details...", text: $text)
            .padding(.horizontal)
            .autocorrectionDisabled(true)
            .frame(height: 44)
            .keyboardType(.asciiCapable)
            .focused($isKeyboardActive)
    }
}

#Preview {
    TextFieldView(text: .constant("Coffee at City center."))
}
