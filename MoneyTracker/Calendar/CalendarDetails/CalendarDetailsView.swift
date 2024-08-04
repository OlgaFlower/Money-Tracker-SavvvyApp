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
    var selectedDate: Date?
    
    // MARK: - Body
    var body: some View {
        ZStack {
            BackgroundGradView()
            VStack {
                self.cancelButton
                    .padding(.horizontal, 24)
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
}

#Preview {
    CalendarDetailsView(selectedDate: Date.now)
}
