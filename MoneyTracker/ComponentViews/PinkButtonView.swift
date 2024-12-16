//
//  PinkButtonView.swift
//  Savvvy
//
//  Created by Olha Bereziuk on 12.12.24.
//

import SwiftUI

struct PinkButtonView: View {
    
    // MARK: - States
    @Binding var isActive: Bool
    
    // MARK: - Properties
    var title: String
    var systemImage: String?
    var isHeavyFont: Bool = false
    
    // MARK: - Actions
    var action: () -> Void
    
    // MARK: - Body
    var body: some View {
        ZStack {
            if self.isActive {
                self.gradientView
                self.innerShadowView
            } else {
                self.greyView
            }
            self.titleView
        }
        .animation(.easeInOut(duration: 0.5), value: self.isActive)
        .onTapGesture {
            self.action()
        }
    }
    
    // MARK: - Views
    private var greyView: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(.white)
            .frame(height: 55)
    }
    
    private var gradientView: some View {
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
        HStack(spacing: 6) {
            Text(self.title)
            if let systemImage = self.systemImage {
                Image(systemName: systemImage)
            }
        }
        .font(
            .system(
                size: 16, 
                weight: self.isHeavyFont ? .heavy : .bold,
                design: .default
            )
        )
        .foregroundStyle(self.isActive ? .white : .black)
    }
}

#Preview {
    PinkButtonView(isActive: .constant(false), title: "Let's go", systemImage: "plus", action: {})
}
