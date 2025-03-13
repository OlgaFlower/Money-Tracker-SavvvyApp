//
//  RecurringRangeSelectorView.swift
//  Monika
//
//  Created by Olha Bereziuk on 07.03.25.
//

import SwiftUI

struct RecurringRangeSelectorView: View {
    
    @Binding var recurringRange: Int
    @Binding var recurringUnit: RecurringUnit
    
    var onMinusTap: () -> Void
    var onPlusTap: () -> Void
    var onLeftChevronTap: () -> Void
    var onRightChevronTap: () -> Void
    
    var body: some View {
        HStack {
            ArrowBtnView(
                iconName: "chevron.left",
                action: {
                    onLeftChevronTap()
                }
            )
            
            Spacer()
            
            RecurringFormTxtView(text: "Every")
            
            RecurringFormTxtView(
                text: "\(self.recurringRange)",
                fontSize: 18,
                weight: .medium,
                color: .blue
            )
            
            RecurringFormTxtView(
                text: self.recurringUnit.rawValue,
                fontSize: 16,
                weight: .medium
            )
            .padding(.trailing, 4)
            
            PlusMinusBtnView(
                onMinusTap: onMinusTap,
                onPlusTap: onPlusTap
            )
            
            Spacer()
            
            ArrowBtnView(
                iconName: "chevron.right",
                action: {
                    onRightChevronTap()
                }
            )
        }
        .padding(.vertical)
        .padding(.horizontal)
    }
}

#Preview {
    RecurringRangeSelectorView(
        recurringRange: .constant(3),
        recurringUnit: .constant(.months),
        onMinusTap: {},
        onPlusTap: {},
        onLeftChevronTap: {},
        onRightChevronTap: {}
    )
}
