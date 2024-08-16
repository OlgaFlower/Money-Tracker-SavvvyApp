//
//  TitleView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 16.08.24.
//

import SwiftUI

struct TitleView: View {
    // MARK: - Properties
    let date: Date
    
    // MARK: - Body
    var body: some View {
        HStack {
            Text(date.formattedDayMonthYear().uppercased())
                .font(.customFont(style: .medium, size: .title))
                .opacity(0.8)
            Spacer()
        }
    }
}

#Preview {
    TitleView(date: Date.now)
}
