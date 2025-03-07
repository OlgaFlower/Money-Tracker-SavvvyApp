//
//  CustomSegmentedControl.swift
//  Monika
//
//  Created by Olha Bereziuk on 03.03.25.
//

import SwiftUI

struct CustomSegmentedControl: View {
    
    @Binding var tag: Int
    var controlOptions: [String]
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: 0) {
            ForEach(self.controlOptions.indices, id: \.self) { index in
                ZStack {
                    Rectangle()
                        .fill(.clear)
                    
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(Color(.systemBackground))
                        .padding(2)
                        .opacity(self.tag == index ? 1 : 0)
                        
                }
                .overlay(
                    Text(self.controlOptions[index])
                        .foregroundStyle(self.tag == index ? .blue : .primary.opacity(0.4))
                        .fontWeight(.regular)
                )
                .onTapGesture {
                    withAnimation(.interactiveSpring()) {
                        VibrateService.vibrateMedium()
                        self.tag = index
                    }
                }
            }
        }
        .frame(height: 44)
        .background(.background.secondary)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    CustomSegmentedControl(tag: .constant(0), controlOptions: ["Expense", "Income"])
}

