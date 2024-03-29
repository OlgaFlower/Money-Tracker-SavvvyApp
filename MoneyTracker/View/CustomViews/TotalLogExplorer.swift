//
//  TotalLogExplorer.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 25.03.24.
//

import SwiftUI

struct TotalLogExplorer: View {
    
    // MARK: - Properties
    @State private var activeIdx: LogDateRange = .daily
    private let activeWidth = UIScreen.main.bounds.width / 3
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .underlineLeading, spacing: 0) {
            HStack(spacing: 0) {
                /// Daily
                self.dailyButton
                /// Monthly
                self.monthlyButton
                /// Calendar
                self.calendarButton
            }
            .padding(.bottom, 8)
            
            Rectangle()
                .foregroundColor(.accent)
                .alignmentGuide(.underlineLeading) { dimenssion in dimenssion[.leading]  }
                .frame(width: self.activeWidth,  height: 1.2)
                .animation(.linear, value: self.activeIdx)
            
        }
    }
    
    // MARK: - Views
    private var dailyButton: some View {
        Text("Daily")
            .foregroundStyle(.mainNavy)
            .opacity(activeIdx == .daily ? 1.0 : 0.4)
        
            .frame(width: activeWidth)
            .modifier(SlidingUnderline(activeIdx: $activeIdx, idx: .daily))
            .background(CustomUnderlineView())
    }
    
    private var monthlyButton: some View {
        Text("Monthly")
            .foregroundStyle(.mainNavy)
            .opacity(activeIdx == .monthly ? 1.0 : 0.4)
        
            .frame(width: activeWidth)
            .modifier(SlidingUnderline(activeIdx: $activeIdx, idx: .monthly))
            .background(CustomUnderlineView())
    }
    
    private var calendarButton: some View {
        Text("Calendar")
            .foregroundStyle(.mainNavy)
            .opacity(activeIdx == .calendar ? 1.0 : 0.4)
        
            .frame(width: activeWidth)
            .modifier(SlidingUnderline(activeIdx: $activeIdx, idx: .calendar))
            .background(CustomUnderlineView())
    }
}

#Preview {
    TotalLogExplorer()
}
