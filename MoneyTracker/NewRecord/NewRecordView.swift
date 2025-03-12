//
//  NewRecordView.swift
//  Monika
//
//  Created by Olha Bereziuk on 23.12.24.
//

import SwiftUI

struct NewRecordView: View {
    
    @StateObject var viewModel: NewRecordViewModel
    @State private var showCategorySelection = false
    @FocusState private var focusedField: TextFieldCase?
    
    var onDismiss: () -> Void
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 11) {
                    
                    self.cancelBtnView
                    self.segmentedControlView
                    self.currencyView
                    self.categorySelector
                    self.recurringSelector
                    
                    if self.viewModel.regularCatSelected {
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
                isSelected: self.$showCategorySelection,
                selectedCategoryType: self.viewModel.newRecord.categoryType
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
            tag: self.$viewModel.preselectedTag,
            controlOptions: self.viewModel.controlOptions
        )
        .onChange(of: self.viewModel.preselectedTag) { _, _ in
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
    
    private var categorySelector: some View {
        SelectorButtonView(
            title: self.viewModel.regularCatTitle,
            iconName: self.viewModel.regularCatIcon,
            isSelected: Binding(
                get: { self.viewModel.regularCatSelected },
                set: { _ in }
            ),
            action: ({
                self.showCategorySelection.toggle()
            })
        )
        .padding(.bottom)
    }
    
    private var recurringSelector: some View {
        SelectorButtonView(
            title: self.viewModel.recurringCatTitle,
            iconName: self.viewModel.recurringCatIcon,
            isSelected: Binding(
                get: { self.viewModel.recurringCatSelected },
                set: { _ in }
            ),
            action: ({
                // TODO: -
            })
        )
    }
    
    private var recurringDateRangeSelector: some View {
        RecurringRangeSelectorView(
            recurringRange: self.$viewModel.recurringRange) {
                self.viewModel.reduceRange()
            } onPlusTap: {
                self.viewModel.increaseRange()
            }
    }
    
    private var descriptionView: some View {
        DescriptionView(text: self.$viewModel.newRecord.description)
            .focused(self.$focusedField, equals: .description)
            .padding(.top, 24)
    }
    
    private var saveBtn: some View {
        VStack {
            Spacer()
            PinkButtonView(title: "Save") {
                // TODO: -
            }
            .padding(.bottom, 24)
        }
    }
}

// MARK: - Preview
#Preview {
    NewRecordView(
        viewModel: NewRecordViewModel(),
        onDismiss: {}
    )
}
