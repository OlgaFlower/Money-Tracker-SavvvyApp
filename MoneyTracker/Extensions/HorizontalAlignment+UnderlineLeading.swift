//
//  HorizontalAlignment.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 28.03.24.
//

import SwiftUI

/// Using for making custom sliding button's underline (highlite)
extension HorizontalAlignment {
    
    private enum UnderlineLeading: AlignmentID {
        
        static func defaultValue(in dimensions: ViewDimensions) -> CGFloat {
            return dimensions[.leading]
        }
    }
    static let underlineLeading = HorizontalAlignment(UnderlineLeading.self)
}
