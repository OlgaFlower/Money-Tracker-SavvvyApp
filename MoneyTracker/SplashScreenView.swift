//
//  SplashScreenView.swift
//  Savvvy
//
//  Created by Olha Bereziuk on 15.12.24.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var circleSize: CGFloat = 30
    @State private var circleOpacity: Double = 1
    @Binding var isSplashActive: Bool
    
    var body: some View {
        
        ZStack {
            Color.pink
                .opacity(self.circleOpacity)
                .ignoresSafeArea()
            
            Circle()
                .fill(Color.pink)
                .frame(width: self.circleSize, height: self.circleSize)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.0)) {
                self.circleSize = UIScreen.main.bounds.width * 3
                self.circleOpacity = 0
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.isSplashActive = false
            }
        }
    }
}

#Preview {
    SplashScreenView(isSplashActive: .constant(true))
}
