//
//  DateHeaderView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 18.08.24.
//

import SwiftUI

struct DateHeaderView: View {
    
    let date: Date
    
    var body: some View {
        HStack {
            Text(date.formattedDayMonthYear().uppercased())
                .font(.customFont(style: .medium, size: .title))
                .padding(.leading, 16)
            Spacer()
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    DateHeaderView(date: Date.now)
}
