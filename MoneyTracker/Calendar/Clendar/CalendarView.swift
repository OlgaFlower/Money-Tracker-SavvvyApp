//
//  CalendarView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 31.07.24.
//

import SwiftUI

struct CalendarView: View {
    
    // MARK: - States
    @State private var date = Date.now
    @State private var days: [Date] = []
    
    // MARK: - Properties
    let daysOfWeek = Date.uppercasedWeekdays
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    
    // MARK: - Body
    var body: some View {
        ZStack {
            BackgroundGradView()
            
            VStack {
                /// Month and Year
                HStack {
                    self.chevronLeft
                        .padding(.leading, 68)
                    Spacer()
                    self.titleView
                    Spacer()
                    self.chevronRight
                        .padding(.trailing, 68)
                }
                /// Days of the week
                HStack {
                    ForEach(self.daysOfWeek.indices, id: \.self) { index in
                        Text(self.daysOfWeek[index])
                            .autocapitalization(.allCharacters)
                            .font(.customFont(style: .medium, size: .small))
                            .opacity(0.8)
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding(.top, 35)
                /// Numbers
                LazyVGrid(columns: self.columns) {
                    ForEach(self.days, id: \.self) { day in
                        
                        if day.monthInt != date.monthInt {
                            Text("")
                        } else {
                            Text(day.formatted(.dateTime.day()))
                                .font(.customFont(style: .semibold, size: .body))
                                .opacity(0.8)
                                .frame(maxWidth: .infinity, minHeight: 40)
                                .background(
                                    RoundedRectangle(cornerRadius: 4.0)
                                        .foregroundStyle(
                                            Date.now.startOfDay == day.startOfDay ? .blue : .white.opacity(0.15) 
                                        )
                                )
                        }
                    }
                }
                Spacer()
            }
            .padding(.top, 35)
            .padding(.horizontal)
        }
        .foregroundStyle(.white)
        .onAppear {
            self.days = self.date.calendarDisplayDays
        }
        .onChange(of: self.date) {
            self.days = self.date.calendarDisplayDays
        }
    }
    
    // MARK: - Views
    private var titleView: some View {
        Text(self.date.formattedMonthYear().uppercased())
            .font(.customFont(style: .semibold, size: .body))
            .opacity(0.8)
    }
    
    private var chevronLeft: some View {
        Image(systemName: "chevron.left")
            .font(.customFont(style: .semibold, size: .body))
    }
    
    private var chevronRight: some View {
        Image(systemName: "chevron.right")
            .font(.customFont(style: .semibold, size: .body))
    }
}

#Preview {
    ContentView()
}
