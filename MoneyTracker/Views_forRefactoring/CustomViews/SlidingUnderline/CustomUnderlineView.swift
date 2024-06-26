//
//  CustomUnderlineView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 28.03.24.
//

import SwiftUI

struct CustomUnderlineView: View {
    var body: some View {
            GeometryReader { geometry in
                return Rectangle().fill(Color.clear).preference(key: WidthPreferenceKey.self, value: geometry.size.width)
            }
        }
}
