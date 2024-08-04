//
//  CalendarDetailsView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 04.08.24.
//

import SwiftUI

struct CalendarDetailsView: View {
    // MARK: - Environment
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Properties
    @Binding var selectedDate: Date
    
    // MARK: - Body
    var body: some View {
        ZStack {
            BackgroundGradView()
            
                VStack(spacing: 32) {
                    self.cancelButton
                        .padding(.horizontal, 24)
                    
                    self.titleView
                    
                    Spacer()
                }
                .foregroundStyle(.white)
                .padding(.top, 32)
        }
    }
    
    // MARK: - Views
    /// CANCEL
    private var cancelButton: some View {
        HStack {
            Spacer()
            Button(action: {
                Constants.vibrateLight()
                self.dismiss()
            }, label: {
                Image(systemName: "plus")
                    .font(Font.system(size: 28))
                    .opacity(0.8)
                    .rotationEffect(.degrees(45))
            })
        }
    }
    /// TITLE
    private var titleView: some View {
        Text(selectedDate.formattedDayMonthYear().uppercased())
            .font(.customFont(style: .semibold, size: .body))
            .opacity(0.8)
    }
}

#Preview {
    CalendarDetailsView(selectedDate: .constant(Date.now))
}
