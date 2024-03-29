//
//  SlidingUnderline.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 28.03.24.
//

import SwiftUI

struct SlidingUnderline: ViewModifier {
    
    /// x - coordinate
    @Binding var activeIdx: Int
    let idx: Int

    func body(content: Content) -> some View {
            Group {
                if activeIdx == idx {
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
