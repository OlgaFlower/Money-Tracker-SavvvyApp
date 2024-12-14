//
//  PinkButtonView.swift
//  Savvvy
//
//  Created by Olha Bereziuk on 12.12.24.
//

import SwiftUI

struct PinkButtonView: View {
    
    // MARK: - Properties
    var title: String
    
    // MARK: - Body
    var body: some View {
        ZStack {
            self.backgroundView
            self.innerShadowView
            self.titleView
        }
    }
    
    // MARK: - Views
    private var backgroundView: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            Color(red: 1.0, green: 0.18, blue: 0.33),
                            Color(red: 1.0, green: 0.51, blue: 0.64)
                        ]
                    ),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .frame(height: 55)
    }
    
    private var innerShadowView: some View {
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
            .frame(height: 55)
            .mask(
                VStack(spacing: 0) {
                    Rectangle().fill(Color.clear)
                    Rectangle().fill(Color.white)
                }
            )
            .blur(radius: 6)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
        }
    
    private var titleView: some View {
        Text(self.title)
            .font(.system(size: 16, weight: .bold, design: .default))
            .foregroundStyle(.white)
    }
}

#Preview {
    PinkButtonView(title: "Let's go")
}
