//
//  DescriptionInputView.swift
//  Monika
//
//  Created by Olha Bereziuk on 07.03.25.
//

import SwiftUI

struct DescriptionInputView: View {
    
    @Binding var text: String
    
    var body: some View {
        ZStack {
            DescriptionBackgroundView()
            TextFieldView(text: self.$text)
        }
    }
}

#Preview {
    DescriptionInputView(text: .constant("Groceries in City Center."))
}
