//
//  BackgroundArt.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 21.03.24.
//

import SwiftUI

struct BackgroundArt: View {
    var body: some View {
            Image("background_art")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    BackgroundArt()
}
