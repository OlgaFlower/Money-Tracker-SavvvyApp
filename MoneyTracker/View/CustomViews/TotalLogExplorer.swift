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
                        .foregroundColor(selectedRange == .daily ? .orange : .clear)
                }
                
                /// Monthly
                VStack {
                    self.monthlyButton
                    self.separatorView
                        .foregroundColor(selectedRange == .monthly ? .orange : .clear)
                }
                
                /// Calendar
                VStack {
                    self.calendarButton
                    self.separatorView
                        .foregroundColor(selectedRange == .calendar ? .orange : .clear)
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
                .foregroundColor(self.selectedRange == .daily ? .mainNavy : .gray)
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
                .foregroundColor(self.selectedRange == .monthly ? .mainNavy : .gray)
                .fontWeight(self.selectedRange == .monthly ? .semibold : .regular)
                .animation(.easeInOut(duration: 0.1), value: self.selectedRange)
        })
    }
    
    private var calendarButton: some View {
        Button(action: {
            self.selectedRange = .calendar
        }, label: {
            Text("Calendar")
                .foregroundColor(self.selectedRange == .calendar ? .mainNavy : .gray)
                .fontWeight(self.selectedRange == .calendar ? .semibold : .regular)
                .animation(.easeInOut(duration: 0.1), value: self.selectedRange)
        })
    }
    
    private var separatorView: some View {
        Rectangle()
            .frame(height: 3)
    }
}

#Preview {
    HomeView()
}
