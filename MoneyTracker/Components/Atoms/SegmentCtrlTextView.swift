//
//  SegmentCtrlTextView.swift
//  Monika
//
//  Created by Olha Bereziuk on 07.03.25.
//

import SwiftUI

struct SegmentCtrlTextView: View {
    
    var title: String
    var isSelected: Bool
    
    var body: some View {
        Text(title)
            .foregroundStyle(isSelected ? .blue : .primary.opacity(0.4))
            .fontWeight(.regular)
    }
}

#Preview {
    SegmentCtrlTextView(title: "Expense", isSelected: true)
}
