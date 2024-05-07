//
//  SlidingUnderline.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 28.03.24.
//

import SwiftUI

struct SlidingUnderline: ViewModifier {
    
    /// x - coordinate
    @Binding var activeIdx: LogDateRange
    let idx: LogDateRange

    func body(content: Content) -> some View {
            Group {
                if self.activeIdx == idx {
                    content.alignmentGuide(.underlineLeading) { d in
                        return d[.leading]
                    }
                    .onTapGesture { 
                        self.activeIdx = self.idx
                    }
                } else {
                    content.onTapGesture { self.activeIdx = self.idx }
                }
            }
        }
}
