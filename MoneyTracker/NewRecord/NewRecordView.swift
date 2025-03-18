//
//  NewRecordView.swift
//  Monika
//
//  Created by Olha Bereziuk on 23.12.24.
//

import SwiftUI

struct NewRecordView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: NewRecordViewModel
    @State private var showCategorySelection = false
    @FocusState private var focusedField: TextFieldCase?
    @Binding var recordsUpdated: Bool
    
    var onDismiss: () -> Void
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 11) {
                    
                    self.cancelBtnView
                    self.segmentedControlView
                    self.currencyView
                    self.generalCategorySelector
                    self.recurringCategorySelector
                    
                    if self.viewModel.recurringCatPrepared {
                        self.recurringDateRangeSelector
                    }
                    
                    self.descriptionView
                    Spacer()
                }
                .padding(.horizontal, 24)
            }
            .onTapGesture {
                self.focusedField = nil
            }
            
            if self.focusedField == nil {
                self.saveBtn
            }
        }
        .sheet(isPresented: self.$showCategorySelection, content: {
            CategoriesView(
                record: self.$viewModel.newRecord,
                isSelected: self.$showCategorySelection
            )
        })
    }
    
    // MARK: - Views
    private var cancelBtnView: some View {
        CancelButtonView {
            onDismiss()
        }
        .padding(.bottom, 24)
    }
    
    private var segmentedControlView: some View {
        CustomSegmentedControlView(
            tag: self.$viewModel.segemntedControlTag,
            controlOptions: self.viewModel.controlOptions
        )
        .onChange(of: self.viewModel.segemntedControlTag) { _, _ in
            self.viewModel.setCategoryToDefault()
        }
    }
    
    private var currencyView: some View {
        CurrencyInputView(
            inputAmount: self.$viewModel.inputAmount,
            currency: self.viewModel.currencySign,
            useCase: .newRecord)
        .focused(self.$focusedField, equals: .currency)
    }
    
    private var generalCategorySelector: some View {
        SelectorButtonView(
            title: self.viewModel.regularCatTitle,
            iconName: self.viewModel.generalCatIcon,
            isSelected: Binding(
                get: { self.viewModel.regularCatPrepared },
                set: { _ in }
            ),
            action: ({
                self.viewModel.setCategoryToDefault()
                self.viewModel.recurringCatTapped = false
                self.viewModel.setupNewRecordCategoryType()
                self.showCategorySelection.toggle()
            })
        )
        .padding(.bottom)
    }
    
    private var recurringCategorySelector: some View {
        SelectorButtonView(
            title: self.viewModel.recurringCatTitle,
            iconName: self.viewModel.recurringCatIcon,
            isSelected: Binding(
                get: { self.viewModel.recurringCatPrepared },
                set: { _ in }
            ),
            action: ({
                self.viewModel.setCategoryToDefault()
                self.viewModel.recurringCatTapped = true
                self.viewModel.setupNewRecordCategoryType()
                self.showCategorySelection.toggle()
            })
        )
    }
    
    private var recurringDateRangeSelector: some View {
        RecurringRangeSelectorView(
            recurringRange: self.$viewModel.recurringRange,
            recurringUnit: self.$viewModel.recurringUnit,
            onMinusTap: self.viewModel.reduceRange,
            onPlusTap: self.viewModel.increaseRange,
            onLeftChevronTap: self.viewModel.previousUnit,
            onRightChevronTap: self.viewModel.nextUnit
        )
    }
    
    private var descriptionView: some View {
        DescriptionView(text: self.$viewModel.newRecord.note)
            .focused(self.$focusedField, equals: .description)
            .padding(.top, 24)
    }
    
    private var saveBtn: some View {
        VStack {
            Spacer()
            PinkButtonView(
                isBtnActive: Binding<Bool>(
                    get: { self.viewModel.activateSaveBtn },
                    set: { _ in }
                ),
                title: "Save"
            ) {
                self.viewModel.saveNewRecord(context: self.viewContext)
                self.recordsUpdated = true
                dismiss()
            }
            .padding(.bottom, 24)
        }
    }
}

// MARK: - Preview
#Preview {
    NewRecordView(
        viewModel: NewRecordViewModel(),
        recordsUpdated: .constant(true),
        onDismiss: {}
    )
}
