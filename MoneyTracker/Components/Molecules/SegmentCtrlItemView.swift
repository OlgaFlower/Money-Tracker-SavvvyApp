//
//  SegmentCtrlItemView.swift
//  Monika
//
//  Created by Olha Bereziuk on 07.03.25.
//

import SwiftUI

struct SegmentCtrlItemView: View {
    
    var title: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Rectangle().fill(.clear)
            
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color(.systemBackground))
                .padding(2)
                .opacity(isSelected ? 1 : 0)
        }
        .overlay(
            SegmentCtrlTextView(
                title: title,
                isSelected: isSelected
            )
        )
        .onTapGesture {
            withAnimation(.interactiveSpring()) {
                VibrateService.vibrateMedium()
                action()
            }
        }
    }
}

#Preview {
    SegmentCtrlItemView(
        title: "Expense",
        isSelected: false,
        action: {}
    )
}
