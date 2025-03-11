//
//  CategoryLabel.swift
//  Monika
//
//  Created by Olha Bereziuk on 11.03.25.
//

import SwiftUI

struct CategoryLabel: View {
    
    let text: String
    
    var body: some View {
        Text(self.text)
            .foregroundStyle(.primary)
    }
}

#Preview {
    CategoryLabel(text: "Food")
}
