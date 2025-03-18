//
//  ButtonContentView.swift
//  Monika
//
//  Created by Olha Bereziuk on 07.03.25.
//

import SwiftUI

struct ButtonContentView: View {
    
    var title: String
    @Binding var isActive: Bool
    
    var body: some View {
        ZStack {
            ButtonBackgroundView(isActive: self.$isActive)
            ButtonTitleView(
                title: self.title,
                isActive: self.isActive
            )
        }
    }
}

#Preview {
    Group {
        ButtonContentView(
            title: "Save",
            isActive: .constant(true)
        )
        
        ButtonContentView(
            title: "Save",
            isActive: .constant(false)
        )
    }
}
