//
//  CustomSegmentedControlView.swift
//  Monika
//
//  Created by Olha Bereziuk on 07.03.25.
//

import SwiftUI

struct CustomSegmentedControlView: View {
    
    @Binding var tag: Int
    var controlOptions: [String]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(controlOptions.indices, id: \.self) { index in
                SegmentCtrlItemView(
                    title: controlOptions[index],
                    isSelected: tag == index,
                    action: { tag = index }
                )
            }
        }
        .frame(height: 44)
        .background(.background.secondary)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    CustomSegmentedControlView(tag: .constant(1), controlOptions: ["Expense", "Income"])
}
