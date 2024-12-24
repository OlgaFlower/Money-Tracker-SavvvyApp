//
//  NewRecordView.swift
//  Savvvy
//
//  Created by Olha Bereziuk on 23.12.24.
//

import SwiftUI

struct NewRecordView: View {
    
    // MARK: - States
    @StateObject private var viewModel = NewRecordViewModel()
    
    // MARK: - Actions
    var onDismiss: () -> Void
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            self.backgroundView
            
            VStack(spacing: 0) {
                self.rectangleView
                    .padding(.top, 6)
                self.cancelButton
                    .padding(.top, 8)
                Spacer()
            }
        }
    }
    
    // MARK: - Views
    private var backgroundView: some View {
        Rectangle()
            .ignoresSafeArea()
            .foregroundStyle(.background)
    }
    
    private var rectangleView: some View {
        RoundedRectangle(cornerRadius: 2.5)
            .fill(Color(hex: "E3E3E5"))
            .frame(width: 66, height: 5)
    }
    
    private var cancelButton: some View {
        HStack {
            Spacer()
            Image(systemName: "xmark.circle.fill")
                .font(.system(size: 25, weight: .regular, design: .default))
                .foregroundStyle(Color(hex: "E3E3E5"))
                .padding(.trailing, 28)
        }
        .onTapGesture {
            self.onDismiss()
        }
    }
}

// MARK: - Preview
#Preview {
    NewRecordView(onDismiss: {})
}
