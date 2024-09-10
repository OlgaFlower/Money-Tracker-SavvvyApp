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
    @Binding var recordId: String
    @State private var isDatePickerPresented = false
    @State private var isCategoryPresented = false
    @State private var editingItem = MoneyModel()
    
    // MARK: - Body
    var body: some View {
        ZStack {
            BackgroundGradView()
            
            VStack {
                CancelButtonView(action: { dismiss() })
                TextHeaderView(text: "editing")
                    .padding(.top, 16)
                
                VStack(spacing: 32) {
                    self.makeDateEditor()
                    self.sumView
                    self.categoryView
                    self.noteView
                }
                .padding([.top, .horizontal], 50)
                
                Spacer()
                self.saveButtonView
            }
            .padding(.top, 16)
            .blur(radius: isDatePickerPresented ? 10 : 0)
            
            self.datePickerView
        }
        .foregroundStyle(.white)
        .animation(.easeInOut(duration: 0.4), value: self.isDatePickerPresented)
        .sheet(isPresented: self.$isCategoryPresented) {
            CategoryGroupSelectionView(
                recordType: self.$editingItem.recordType,
                selectedCategory: self.$editingItem.category)
        }
    }
    
    // MARK: - Views
    // Date Picker
    @ViewBuilder
    private var datePickerView: some View {
        if isDatePickerPresented {
            Rectangle()
                .fill(.darkBlue.opacity(0.6))
                .ignoresSafeArea()
            
            DatePickerView(
                recordTimestamp: $editingItem.timestamp,
                isPresented: $isDatePickerPresented
            )
            .padding(.horizontal, 32)
            .transition(.scale)
        }
    }
    // Date
    private func makeDateEditor() -> some View {
        HStack {
            self.dateEditorView
                .onTapGesture {
                    self.isDatePickerPresented.toggle()
                }
            Spacer()
        }
    }
    private var dateEditorView: some View {
        DateTitleView(
            date: self.$editingItem.timestamp,
            style: .regular,
            size: .body
        )
        .padding()
    }
    // Sum
    private var sumView: some View {
        HStack {
            TextHeaderView(text: self.editingItem.moneyAmount)
            Spacer()
        }
    }
    // Notes
    private var noteView: some View {
        HStack {
            SmallTextView(text: self.editingItem.notes)
            Spacer()
        }
        .padding([.leading, .top])
    }
    // Category
    private var categoryView: some View {
        HStack {
            Image(systemName: self.editingItem.category.icon)
                .padding(.trailing)
            TextTitleView(text: self.$editingItem.category.name, style: .regular)
            Spacer()
        }
        .padding([.leading, .top])
        .onTapGesture {
            self.isCategoryPresented.toggle()
        }
    }
    // Save
    private var saveButtonView: some View {
        Button {
            self.viewModel.vibrateMedium()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.viewModel.vibrateMedium()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    dismiss()
                }
            }
        } label: {
            TextView(text: "save", style: .medium)
                .padding(.vertical, 10)
                .frame(width: 130)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .stroke(.white, lineWidth: 0.5)
        )
        .padding(.bottom, 100)
    }
}

#Preview {
    EditRecordView(recordId: .constant(""))
}
