//
//  EditRecordView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 17.08.24.
//

import SwiftUI

struct EditRecordView: View {
    // MARK: - Environment
    @Environment(\.dismiss) var dismiss
    
    // MARK: - State
    @StateObject private var viewModel = EditRecordViewModel()
    @State var sum = "0,00 €"
    @State var category = Category(moneyGroupType: .none, name: "category", icon: "sun.min")
    @State var note = "Some note here"
    @State private var selectedDate: Date
    @State private var isDatePickerPresented = false
    
    // MARK: - Init
    init(recordTimestamp: Date) {
        _selectedDate = State(initialValue: recordTimestamp)
    }
    
    // MARK: - Body
    var body: some View {
        ZStack {
            BackgroundGradView()
            VStack {
                CancelButtonView(action: { dismiss() })
                TextHeaderView(text: "EDIT")
                    .padding(.top, 16)
                
                VStack(spacing: 32) {
                    self.dateEditorView
                        .onTapGesture {
                            self.isDatePickerPresented.toggle()
                        }
                    self.sumView
                    self.noteView
                    self.categoryView
                }
                .padding(.top, 32)
                self.updateButtonView
                    .padding(.top, 48)
                Spacer()
            }
            .padding(.top, 16)
            .blur(radius: isDatePickerPresented ? 10 : 0)
            
            if isDatePickerPresented {
                Rectangle()
                    .fill(.darkBlue.opacity(0.6))
                    .ignoresSafeArea()
                    
                DatePickerView(
                    recordTimestamp: $selectedDate,
                    isPresented: $isDatePickerPresented
                )
                .padding(.horizontal, 32)
                .transition(.scale)
            }
        }
        .foregroundStyle(.white)
        .animation(.easeInOut(duration: 0.4), value: self.isDatePickerPresented)
    }
    
    // MARK: - Views
    /// Date
    private var dateEditorView: some View {
        ZStack {
            BackgroundRectangleView(heigt: 50)
            HStack {
                TextView(text: "Date")
                Spacer()
                DateTitleView(
                    date: self.$selectedDate,
                    style: .regular,
                    size: .body
                )
                .padding(.vertical, 6)
                .padding(.horizontal, 12)
                .background {
                    RoundedRectangle(cornerRadius: 4, style: .continuous)
                        .fill(.black.opacity(0.15))
                }
            }
            .padding(.horizontal, 32)
        }
        .foregroundStyle(.white)
    }
    /// Sum
    private var sumView: some View {
        ZStack {
            BackgroundRectangleView(heigt: 50)
            HStack {
                TextHeaderView(text: self.sum, centerHeader: true)
            }
            .padding(.horizontal, 18)
        }
    }
    /// Notes
    private var noteView: some View {
        ZStack {
            BackgroundRectangleView(heigt: 50)
            HStack {
                Text(self.note)
                    .font(.customFont(style: .regular, size: .body))
                Spacer()
            }
            .padding(.horizontal, 32)
        }
    }
    /// Category
    private var categoryView: some View {
        ZStack {
            BackgroundRectangleView(heigt: 50)
            HStack {
                Image(systemName: self.category.icon)
                    .padding(.trailing)
                TextTitleView(text: self.$category.name, style: .regular)
                Spacer()
            }
            .padding(.horizontal, 32)
        }
    }
    /// Update
    private var updateButtonView: some View {
        Button {
            self.viewModel.vibrateMedium()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.viewModel.vibrateMedium()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    dismiss()
                }
            }
        } label: {
            TextView(text: "update", style: .medium)
                .padding(.vertical, 10)
                .frame(width: 130)
                .clipShape(.rect(cornerRadius: 8, style: .continuous))
        }
        .background {
            /// Border
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(.lightBlue.opacity(0.5))
        }
    }
}

#Preview {
    EditRecordView(recordTimestamp: Date.now)
}
