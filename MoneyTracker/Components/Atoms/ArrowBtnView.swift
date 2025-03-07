//
//  ArrowBtnView.swift
//  Monika
//
//  Created by Olha Bereziuk on 07.03.25.
//

import SwiftUI

struct ArrowBtnView: View {
    
    var iconName: String
    var action: () -> Void
    
    var body: some View {
        Image(systemName: self.iconName)
            .foregroundStyle(.pink)
            .onTapGesture {
                VibrateService.vibrateMedium()
                action()
            }
    }
}

#Preview {
    ArrowBtnView(
        iconName: "chevron.right",
        action: {}
    )
}
