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
    @Binding var recordTimestamp: Date // here must be UUID
    @State var sum = "0,00 €"
    @State var category = Category(moneyGroupType: .none, name: "category", icon: "sun.min")
    @State var note = "Some note here"
    
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
        }
        .foregroundStyle(.white)
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
                    date: self.$recordTimestamp,
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
//                .opacity(self.viewModel.isSaveBtnActive() ? 1 : 0.5)
                .padding(.vertical, 10)
                .frame(width: 130)
                .clipShape(.rect(cornerRadius: 8, style: .continuous))
        }
//        .disabled(!self.viewModel.isSaveBtnActive())
//        .animation(.linear(duration: 0.2), value: self.viewModel.isSaveBtnActive())
        .background {
            /// Border
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(.lightBlue.opacity(0.5))
//                .fill(.lightBlue.opacity(self.viewModel.isSaveBtnActive() ? 1 : 0.5))
        }
    }
}

#Preview {
    EditRecordView(recordTimestamp: .constant(Date.now))
}
