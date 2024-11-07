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
    @Environment(\.managedObjectContext) var viewContext
    
    // MARK: - State
    @StateObject private var viewModel: EditRecordViewModel
    @State private var isDatePickerPresented = false
    @State private var isCategoryPresented = false
    @FocusState var isKeyboardFocused: Bool
    @FocusState var isCurrencyKeyboardFocused: Bool
    @State private var isKeyboardVisible: Bool = false
    
    // MARK: - Init
    init(recordId: String) {
        _viewModel = StateObject(
            wrappedValue: EditRecordViewModel(recordId: recordId)
        )
    }
    
    // MARK: - Body
    var body: some View {
        ZStack {
            BackgroundGradView()
            
            VStack {
                CancelButtonView(action: { dismiss() })
                TextHeaderView(text: "editing")
                    .padding(.top, 16)
                
                VStack(spacing: 26) {
                    self.makeDateEditor()
                    CurrencyTextFieldView(
                        inputAmount: self.$viewModel.inputAmount,
                        currency: self.viewModel.editingItem.currency, 
                        useCase: .editRecord,
                        isKeyboardFocused: _isCurrencyKeyboardFocused
                    )
                    self.categoryView
                        .padding(.top, 4)
                    
                    DescriptionTextfieldView(notes: self.$viewModel.editingItem.notes)
                        .focused(self.$isKeyboardFocused)
                        .padding(.top, 8)
                }
                .padding(.top, 30)
                
                if !self.isKeyboardVisible {
                    self.saveButtonView
                        .padding(.top, 62)
                        .opacity(self.viewModel.isSaveBtnActive() ? 1 : 0.4)
                }
                Spacer()
            }
            .blur(radius: isDatePickerPresented ? 10 : 0)
            .onChange(of: self.isKeyboardFocused || self.isCurrencyKeyboardFocused) { _, newValue in
                withAnimation(.easeIn(duration: 0.2)) {
                    self.isKeyboardVisible = newValue
                }
            }
            
            self.datePickerView
        }
        .animation(.easeInOut(duration: 0.4), value: self.isDatePickerPresented)
        .sheet(isPresented: self.$isCategoryPresented) {
            CategoryGroupSelectionView(
                recordType: self.$viewModel.editingItem.recordType,
                selectedCategory: self.$viewModel.editingItem.category)
        }
        .onTapGesture {
            self.isKeyboardFocused = false
            self.isCurrencyKeyboardFocused = false
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
                recordTimestamp: $viewModel.editingItem.timestamp,
                isPresented: $isDatePickerPresented
            )
            .padding(.horizontal, 32)
            .transition(.scale)
        }
    }
    // Date
    private func makeDateEditor() -> some View {
        self.dateEditorView
            .onTapGesture {
                self.isDatePickerPresented.toggle()
            }
    }
    private var dateEditorView: some View {
        DateTitleView(
            date: self.$viewModel.editingItem.timestamp,
            style: .regular,
            size: .title
        )
    }
    // Category
    private var categoryView: some View {
        HStack {
            Image(systemName: self.viewModel.editingItem.category.icon)
                .padding(.trailing)
                .foregroundStyle(.white)
            TextTitleView(
                text: self.$viewModel.editingItem.category.name,
                style: .medium,
                isCentered: true
            )
        }
        .onTapGesture {
            self.isCategoryPresented.toggle()
        }
    }
    // Save
    private var saveButtonView: some View {
        Button {
            self.viewModel.saveChanges(using: self.viewContext)
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
        .disabled(!self.viewModel.isSaveBtnActive())
        .animation(.linear(duration: 0.2), value: self.viewModel.isSaveBtnActive())
        .overlay(
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .stroke(.white, lineWidth: 0.5)
        )
    }
}

#Preview {
    EditRecordView(recordId: "")
}
