//
//  BackgroundRectangleView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 18.08.24.
//

import SwiftUI

struct BackgroundRectangleView: View {
    // MARK: - Properties
    let heigt: CGFloat
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Color.lightBlue.opacity(0.5))
                .frame(height: self.heigt)
        }
    }
}

#Preview {
    BackgroundRectangleView(heigt: 50)
}
