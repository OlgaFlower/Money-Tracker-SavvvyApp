//
//  DescriptionBackgroundView.swift
//  Savvvy
//
//  Created by Olha Bereziuk on 07.03.25.
//

import SwiftUI

struct DescriptionBackgroundView: View {
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12.0)
            .fill(Color(.secondarySystemBackground))
            .frame(height: 44)
    }
}

#Preview {
    DescriptionBackgroundView()
}
