//
//  VerticalDividerView.swift
//  Monika
//
//  Created by Olha Bereziuk on 07.03.25.
//

import SwiftUI

struct VerticalDividerView: View {
    
    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .frame(width: 1)
                .foregroundStyle(.primary.opacity(0.25))
            Rectangle()
                .frame(width: 1.5)
                .foregroundStyle(.primary.opacity(0.1))
        }
        .frame(width: 2, height: 30)
    }
}

#Preview {
    VerticalDividerView()
}
