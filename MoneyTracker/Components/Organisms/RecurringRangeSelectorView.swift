//
//  RecurringRangeSelectorView.swift
//  Monika
//
//  Created by Olha Bereziuk on 07.03.25.
//

import SwiftUI

struct RecurringRangeSelectorView: View {
    
    @Binding var recurringRange: Int
    var onMinusTap: () -> Void
    var onPlusTap: () -> Void
    
    var body: some View {
        HStack {
            ArrowBtnView(
                iconName: "chevron.left",
                action: {
                    // TODO: -
                }
            )
            
            Spacer()
            
            RecurringFormTxtView(text: "Every")
            
            RecurringFormTxtView(
                text: "\(recurringRange)",
                fontSize: 18,
                weight: .medium,
                color: .blue
            )
            
            RecurringFormTxtView(
                text: "Days",
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
                    // TODO: -
                }
            )
        }
        .padding(.vertical)
        .padding(.horizontal)
    }
}

#Preview {
    RecurringRangeSelectorView(
        recurringRange: .constant(10),
        onMinusTap: {},
        onPlusTap: {}
    )
}
