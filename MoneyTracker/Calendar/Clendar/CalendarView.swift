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
    @State private var selectedDate: Date?
    @State private var isCalendarDetailsPresented = false
    
    // MARK: - Properties
    let daysOfWeek = Date.uppercasedWeekdays
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    
    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            /// Adjusted for iPhones with small screen (screen width of the iPhone SE 3-g)
            let isSmallScreen = geometry.size.width < 376
            
            ZStack {
                BackgroundGradView()
                self.returnView
                    .padding(.bottom, 50)
                
                VStack {
                    self.monthAndYearView
                        .padding(.horizontal, isSmallScreen ? 20 : 46)
                    self.weekDaysView
                        .padding(.top, isSmallScreen ? 20 : 35)
                    self.makeCalendarView(isSmallScreen: isSmallScreen)
                    Spacer()
                }
                .padding(.top, isSmallScreen ? 20 : 35)
                .padding(.horizontal, isSmallScreen ? 12 : 16)
            }
            .foregroundStyle(.white)
            .onAppear {
                self.date = Date.now
                self.days = self.date.calendarDisplayDays
            }
            .onChange(of: self.date) {
                self.days = self.date.calendarDisplayDays
            }
            .fullScreenCover(isPresented: self.$isCalendarDetailsPresented, content: {
                CalendarDetailsView(selectedDate: self.selectedDate)
            })
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
            .onTapGesture {
                self.moveToPreviousMonth()
                Constants.vibrateLight()
            }
    }
    
    private var chevronRight: some View {
        Image(systemName: "chevron.right")
            .font(.customFont(style: .semibold, size: .body))
            .onTapGesture {
                self.moveToNextMonth()
                Constants.vibrateLight()
            }
    }
    
    private var returnBtn: some View {
        Image(systemName: "arrow.counterclockwise")
            .font(.customFont(style: .semibold, size: .title))
            .opacity(0.8)
            .onTapGesture {
                self.date = Date.now
                Constants.vibrateLight()
            }
    }
    
    private var returnView: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                self.returnBtn
                Spacer()
            }
        }
    }
    
    private var monthAndYearView: some View {
        HStack {
            self.chevronLeft
            Spacer()
            self.titleView
            Spacer()
            self.chevronRight
        }
    }
    
    private var weekDaysView: some View {
        HStack {
            ForEach(self.daysOfWeek.indices, id: \.self) { index in
                Text(self.daysOfWeek[index])
                    .autocapitalization(.allCharacters)
                    .font(.customFont(style: .medium, size: .small))
                    .opacity(0.8)
                    .frame(maxWidth: .infinity)
            }
        }
    }
    
    private func makeCalendarView(isSmallScreen: Bool) -> some View {
        LazyVGrid(columns: self.columns, spacing: isSmallScreen ? 8 : 10) {
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
                        .onTapGesture {
                            self.selectedDate = day.startOfDay
                            self.isCalendarDetailsPresented.toggle()
                        }
                }
            }
        }
    }
    // MARK: - Functions
    private func moveToPreviousMonth() {
        if let newDate = Calendar.current.date(byAdding: .month, value: -1, to: self.date) {
            self.date = newDate
        }
    }
    
    private func moveToNextMonth() {
        if let newDate = Calendar.current.date(byAdding: .month, value: 1, to: self.date) {
            self.date = newDate
        }
    }
}

#Preview {
    CalendarView()
}
