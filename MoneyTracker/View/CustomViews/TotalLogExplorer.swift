//
//  TotalLogExplorer.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 25.03.24.
//

import SwiftUI

enum LogDateRange {
    case daily
    case monthly
    case calendar
}

struct TotalLogExplorer: View {
    
    // MARK: - Properties
    @State private var selectedRange: LogDateRange = .daily
    @State private var activeIdx: Int = 0
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
        Button(action: {
            self.selectedRange = .daily
        }, label: {
            Text("Daily")
                .foregroundColor(.mainNavy)
                .opacity(self.selectedRange == .daily ? 1.0 : 0.4)
                .frame(width: activeWidth)
                .modifier(SlidingUnderline(activeIdx: $activeIdx, idx: 0))
                .foregroundColor(.mainNavy)
                .background(CustomUnderlineView())
        })
    }
    
    private var monthlyButton: some View {
        Button(action: {
            withAnimation {
                self.selectedRange = .monthly
            }
        }, label: {
            Text("Monthly")
                .foregroundColor(.mainNavy)
                .opacity(self.selectedRange == .daily ? 1.0 : 0.4)
                .frame(width: activeWidth)
                .modifier(SlidingUnderline(activeIdx: $activeIdx, idx: 1))
                .background(CustomUnderlineView())
        })
    }
    
    private var calendarButton: some View {
        Button(action: {
            self.selectedRange = .calendar
        }, label: {
            Text("Calendar")
                .foregroundColor(.mainNavy)
                .opacity(self.selectedRange == .daily ? 1.0 : 0.4)
                .frame(width: activeWidth)
                .modifier(SlidingUnderline(activeIdx: $activeIdx, idx: 2))
                .background(CustomUnderlineView())
        })
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
