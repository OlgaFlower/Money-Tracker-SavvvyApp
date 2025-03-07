//
//  DescriptionView.swift
//  Savvvy
//
//  Created by Olha Bereziuk on 07.03.25.
//

import SwiftUI

struct DescriptionView: View {
    
    @Binding var text: String
    
    var body: some View {
        DescriptionInputView(text: self.$text)
    }
}

#Preview {
    DescriptionView(text: .constant("Groceries in Rewe."))
}
