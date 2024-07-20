//
//  CustomFomt.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 26.06.24.
//

import SwiftUI
import CoreText

enum CustomFontStyle: String {
    case light = "-Light"
    case regular = "-Regular"
    case medium = "-Medium"
    case semibold = "-SemiBold"
}

enum CustomFontSize {
    case small
    case body
    case title
    case header
    case large
    
    var value: CGFloat {
        switch self {
        case .small:
            return 14
        case .body:
            return 20
        case .title:
            return 26
        case .header:
            return 32
        case .large:
            return 36
        }
    }
}

struct CustomFont {
    static let appFont = "MontserratRoman"
}


