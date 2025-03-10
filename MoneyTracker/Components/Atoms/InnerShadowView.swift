//
//  InnerShadowView.swift
//  Monika
//
//  Created by Olha Bereziuk on 07.03.25.
//

import SwiftUI

struct InnerShadowView: View {
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(
                colors: [
                    Color.clear,
                    Color.pink.opacity(0.4)
                ]
            ),
            startPoint: .top,
            endPoint: .bottom
        )
        .frame(width: 120, height: 44)
        .mask(
            VStack(spacing: 0) {
                Rectangle().fill(Color.clear)
                Rectangle().fill(Color.white)
            }
        )
        .blur(radius: 6)
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
    }
}

#Preview {
    InnerShadowView()
}
