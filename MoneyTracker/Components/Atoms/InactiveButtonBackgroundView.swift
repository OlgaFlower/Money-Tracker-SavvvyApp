//
//  InactiveButtonBackgroundView.swift
//  Monika
//
//  Created by Olha Bereziuk on 07.03.25.
//

import SwiftUI

struct InactiveButtonBackgroundView: View {
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(.secondary.opacity(0.2))
            .frame(width: 120, height: 44)
    }
}

#Preview {
    InactiveButtonBackgroundView()
}
