//
//  PlusMinusBtnView.swift
//  Monika
//
//  Created by Olha Bereziuk on 07.03.25.
//

import SwiftUI

struct PlusMinusBtnView: View {
    
    var onMinusTap: () -> Void
    var onPlusTap: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.background.secondary)
                .frame(width: 130, height: 44)
            
            HStack(spacing: 0) {
                Image(systemName: "minus")
                    .frame(width: 64, height: 44)
                    .font(
                        .system(
                            size: 14,
                            weight: .regular,
                            design: .default
                        )
                    )
                    .contentShape(Rectangle()) /// Prevent TapGesture overlapping
                    .onTapGesture {
                        VibrateService.vibrateMedium()
                        onMinusTap()
                    }
                
                VerticalDividerView()
                
                Image(systemName: "plus")
                    .frame(width: 64, height: 44)
                    .font(
                        .system(
                            size: 14,
                            weight: .regular,
                            design: .default
                        )
                    )
                    .contentShape(Rectangle()) /// Prevent TapGesture overlapping
                    .onTapGesture {
                        VibrateService.vibrateMedium()
                        onPlusTap()
                    }
            }
        }
    }
}

#Preview {
    PlusMinusBtnView(
        onMinusTap: {},
        onPlusTap: {}
    )
}
