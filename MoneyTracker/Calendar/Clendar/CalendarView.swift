//
//  CalendarView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 31.07.24.
//

import SwiftUI

struct CalendarView: View {
    
    // MARK: - States
    @State private var currentDate = Date.now
    @State private var daysInMonth: [Date] = []
    @State private var selectedDate = Date.now
    @State private var isCalendarDetailsPresented = false
    
    // MARK: - Properties
    let daysOfWeek = Date.uppercasedWeekdays
    let gridColumns = Array(repeating: GridItem(.flexible()), count: 7)
    
    // MARK: - Body
    var body: some View {
        
        GeometryReader { geometry in
            /// UI adjusted for iPhones with small screen (screen width of the iPhone SE 3-g)
            let isSmallScreen = geometry.size.width < 376
            
            ZStack {
                BackgroundGradView()
                self.returnButtonView
                    .padding(.bottom, 50)
                
                VStack {
                    self.monthAndYearView
                        .padding(.horizontal, isSmallScreen ? 20 : 46)
                    self.weekDaysHeaderView
                        .padding(.top, isSmallScreen ? 20 : 35)
                    self.calendarGridView(isSmallScreen: isSmallScreen)
                    Spacer()
                }
                .padding(.top, isSmallScreen ? 20 : 35)
                .padding(.horizontal, isSmallScreen ? 12 : 16)
            }
            .foregroundStyle(.white)
            .onAppear {
                self.loadCurrentMonthDays()
            }
            .onChange(of: self.currentDate) {
                self.updateDaysInMonth()
            }
            .fullScreenCover(
                isPresented: self.$isCalendarDetailsPresented,
                content: {
                    CalendarDetailsView(
                        selectedDay: self.selectedDate
                    )
                })
        }
    }
    
    // MARK: - Views
    //TODO: - replace it with TitleView()
    private var titleView: some View {
        
        Text(self.currentDate.formattedMonthYear().uppercased())
            .font(.customFont(style: .semibold, size: .body))
            .opacity(0.9)
    }
    
    private var chevronLeft: some View {
        
        Image(systemName: "chevron.left")
            .font(.customFont(style: .semibold, size: .body))
            .onTapGesture {
                self.moveToPreviousMonth()
                VibrateService.vibrateLight()
            }
    }
    
    private var chevronRight: some View {
        
        Image(systemName: "chevron.right")
            .font(.customFont(style: .semibold, size: .body))
            .onTapGesture {
                self.moveToNextMonth()
                VibrateService.vibrateLight()
            }
    }
    
    private var returnButtonView: some View {
        
        VStack {
            Spacer()
            HStack {
                Spacer()
                Image(systemName: "arrow.counterclockwise")
                    .font(.customFont(style: .semibold, size: .title))
                    .opacity(0.9)
                    .onTapGesture {
                        self.currentDate = Date.now
                        VibrateService.vibrateLight()
                    }
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
    
    private var weekDaysHeaderView: some View {
        
        HStack {
            ForEach(self.daysOfWeek.indices, id: \.self) { index in
                Text(self.daysOfWeek[index])
                    .autocapitalization(.allCharacters)
                    .font(.customFont(style: .medium, size: .small))
                    .opacity(0.9)
                    .frame(maxWidth: .infinity)
            }
        }
    }
    
    private func calendarGridView(isSmallScreen: Bool) -> some View {
        
        LazyVGrid(
            columns: self.gridColumns,
            spacing: isSmallScreen ? 8 : 10
        ) {
            
            ForEach(self.daysInMonth, id: \.self) { day in
                self.calendarDayView(for: day)
            }
        }
    }
    
    @ViewBuilder
    private func calendarDayView(for day: Date) -> some View {
        
        if day.monthInt != self.currentDate.monthInt {
            Text("")
        } else {
            Text(day.formatted(.dateTime.day()))
                .font(.customFont(style: .semibold, size: .body))
                .opacity(0.9)
                .frame(maxWidth: .infinity, minHeight: 40)
                .background(
                    RoundedRectangle(cornerRadius: 4.0)
                        .foregroundStyle(
                            Date.now.startOfDay == day.startOfDay ? .blue : .white.opacity(0.15)
                        )
                )
                .onTapGesture {
                    DispatchQueue.main.async {
                        self.selectedDate = day.startOfDay
                    }
                    self.isCalendarDetailsPresented.toggle()
                }
        }
    }
    
    // MARK: - Actions
    private func moveToPreviousMonth() {
        
        if let newDate = Calendar.current.date(byAdding: .month, value: -1, to: self.currentDate) {
            self.currentDate = newDate
        }
    }
    
    private func moveToNextMonth() {
        
        if let newDate = Calendar.current.date(byAdding: .month, value: 1, to: self.currentDate) {
            self.currentDate = newDate
        }
    }
    
    private func loadCurrentMonthDays() {
        
        self.currentDate = Date.now
        self.daysInMonth = currentDate.calendarDisplayDays
    }
    
    private func updateDaysInMonth() {
        
        self.daysInMonth = self.currentDate.calendarDisplayDays
    }
}

#Preview {
    CalendarView()
}
