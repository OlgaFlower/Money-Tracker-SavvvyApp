//
//  PinkButtonView.swift
//  Savvvy
//
//  Created by Olha Bereziuk on 12.12.24.
//

import SwiftUI

struct PinkButtonView: View {
    private var isActiveBinding: Binding<Bool>?
    @State private var isActiveBtnState: Bool = true
    var title: String
    var action: () -> Void
    
    // MARK: - Initializers
        init(
            isActive: Binding<Bool>,
            title: String,
            action: @escaping () -> Void
        ) {
            self.isActiveBinding = isActive
            self.title = title
            self.action = action
        }
        
        init(
            title: String,
            action: @escaping () -> Void
        ) {
            self.title = title
            self.action = action
        }
    
    // MARK: - Body
    var body: some View {
        let isActive = isActiveBinding?.wrappedValue ?? isActiveBtnState
        ZStack {
            if isActive {
                self.gradientView
                self.innerShadowView
            } else {
                self.greyView
            }
            self.makeTitleView(isActive: isActive)
        }
        .animation(.easeInOut(duration: 0.5), value: isActive)
        .onTapGesture {
            VibrateService.vibrateMedium()
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
    
    private func makeTitleView(isActive: Bool) -> some View {
        Text(self.title)
            .font(
                .system(
                    size: 16,
                    weight: .medium,
                    design: .default
                )
            )
            .foregroundStyle(isActive ? .white : .black)
    }
}

#Preview {
    PinkButtonView(isActive: .constant(true), title: "Let's go", action: {})
}
