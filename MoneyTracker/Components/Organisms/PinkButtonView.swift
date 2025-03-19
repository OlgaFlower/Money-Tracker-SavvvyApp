//
//  PinkButtonView.swift
//  Monika
//
//  Created by Olha Bereziuk on 07.03.25.
//

import SwiftUI

struct PinkButtonView: View {
    
    @Binding var isBtnActive: Bool
    var title: String
    var action: () -> Void
    
    var body: some View {
        
        ButtonContentView(
            title: self.title,
            isActive: self.$isBtnActive
        )
        .animation(.easeInOut(duration: 0.5), value: self.isBtnActive)
        .onTapGesture {
            VibrateService.vibrateMedium()
            action()
        }
    }
}

#Preview {
    PinkButtonView(
        isBtnActive: .constant(false),
        title: "Save",
        action: {}
    )
}
