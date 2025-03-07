//
//  ButtonBackgroundView.swift
//  Monika
//
//  Created by Olha Bereziuk on 07.03.25.
//

import SwiftUI

struct ButtonBackgroundView: View {
    
    var isActive: Bool
    
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
        ButtonBackgroundView(isActive: true)
        ButtonBackgroundView(isActive: false)
    }
}
