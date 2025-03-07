//
//  Fonts.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 26.06.24.
//

import SwiftUI
import CoreText

extension Font {
    
    static func customFont(style: CustomFontStyle, size: CustomFontSize) -> Font {
        let fontName = CustomFont.appFont + style.rawValue
        let ctFont = CTFontCreateWithName(fontName as CFString, size.value, nil)
        return Font(ctFont as CTFont)
    }
}
