//
//  WidthPreferenceKey.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 28.03.24.
//

import SwiftUI

struct WidthPreferenceKey: PreferenceKey {
    static var defaultValue = CGFloat(0)

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }

    typealias Value = CGFloat
}
