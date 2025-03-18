//
//  PinkActiveButtonView.swift
//  Monika
//
//  Created by Olha Bereziuk on 18.03.25.
//

import SwiftUI

struct PinkActiveButtonView: View {
    
    @State var isBtnActive = true
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
    PinkActiveButtonView(
        isBtnActive: true,
        title: "Next",
        action: {}
    )
}
