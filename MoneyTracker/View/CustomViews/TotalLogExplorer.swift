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
    
    @State private var selectedRange: LogDateRange = .daily
    
    var body: some View {
        
        ScrollView {
            HStack(spacing: 0) {
                
                /// Daily
                VStack {
                    self.dailyButton
                    self.separatorView
                        .foregroundColor(selectedRange == .daily ? .mainOrange : .clear)
                }
                
                /// Monthly
                VStack {
                    self.monthlyButton
                    self.separatorView
                        .foregroundColor(selectedRange == .monthly ? .mainOrange : .clear)
                }
                
                /// Calendar
                VStack {
                    self.calendarButton
                    self.separatorView
                        .foregroundColor(selectedRange == .calendar ? .mainOrange : .clear)
                }
            }
            
        }
    }
    
    // MARK: - Views
    
    private var dailyButton: some View {
        Button(action: {
            self.selectedRange = .daily
        }, label: {
            Text("Daily")
                .foregroundColor(self.selectedRange == .daily ? .mainNavy : .mainNavy.opacity(0.5))
                .fontWeight(self.selectedRange == .daily ? .semibold : .regular)
                .animation(.easeInOut(duration: 0.1), value: self.selectedRange)
        })
    }
    
    private var monthlyButton: some View {
        Button(action: {
            withAnimation {
                self.selectedRange = .monthly
            }
            
        }, label: {
            
            Text("Monthly")
                .foregroundColor(self.selectedRange == .monthly ? .mainNavy : .mainNavy.opacity(0.5))
                .fontWeight(self.selectedRange == .monthly ? .semibold : .regular)
                .animation(.easeInOut(duration: 0.1), value: self.selectedRange)
        })
    }
    
    private var calendarButton: some View {
        Button(action: {
            self.selectedRange = .calendar
        }, label: {
            Text("Calendar")
                .foregroundColor(self.selectedRange == .calendar ? .mainNavy : .mainNavy.opacity(0.5))
                .fontWeight(self.selectedRange == .calendar ? .semibold : .regular)
                .animation(.easeInOut(duration: 0.1), value: self.selectedRange)
        })
    }
    
    private var separatorView: some View {
        Rectangle()
            .frame(height: 1.5)
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
