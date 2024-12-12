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
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .frame(height: 55)
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
