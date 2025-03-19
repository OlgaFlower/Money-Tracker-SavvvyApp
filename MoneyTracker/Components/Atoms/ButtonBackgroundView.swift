//
//  ButtonBackgroundView.swift
//  Monika
//
//  Created by Olha Bereziuk on 07.03.25.
//

import SwiftUI

struct ButtonBackgroundView: View {
    
    @Binding var isActive: Bool
    
    var body: some View {
        ZStack {
            if self.isActive {
                GradientView()
                InnerShadowView()
            } else {
                InactiveButtonBackgroundView()
            }
        }
    }
}

#Preview {
    Group {
        ButtonBackgroundView(isActive: .constant(true))
        ButtonBackgroundView(isActive: .constant(false))
    }
}
