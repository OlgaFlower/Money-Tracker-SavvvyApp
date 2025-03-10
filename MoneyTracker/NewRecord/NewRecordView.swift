//
//  NewRecordView.swift
//  Monika
//
//  Created by Olha Bereziuk on 23.12.24.
//

import SwiftUI

struct NewRecordView: View {
    
    @StateObject private var viewModel = NewRecordViewModel()
    @State private var preselectedTag: Int = 0
    @State private var descriptionText: String = ""
    @FocusState private var isKeyboardActive: Bool
    @FocusState var isCurrencyKeyboardFocused: Bool
    
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
            if !isKeyboardActive, !isCurrencyKeyboardFocused {
                self.saveBtn
            }
        }
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
            tag: self.$preselectedTag,
            controlOptions: ["Expense", "Income"]
        )
    }
    
    private var currencyView: some View {
        CurrencyInputView(
            inputAmount: self.$viewModel.inputAmount,
            currency: self.viewModel.currencySign,
            useCase: .newRecord)
    }
    
    private var categorySelector: some View {
        SelectorButtonView(
            title: "Regular",
            iconName: "cart.circle.fill",
            isSelected: Binding(
                get: { self.viewModel.regularCatSelected },
                set: { _ in }
            ),
            action: ({
                // TODO: -
            })
        )
    }
    
    private var recurringSelector: some View {
        SelectorButtonView(
            title: "Recurring",
            iconName: "repeat.circle.fill",
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
        DescriptionView(text: self.$descriptionText)
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
        .transition(.move(edge: .bottom))
    }
}

// MARK: - Preview
#Preview {
    NewRecordView(onDismiss: {})
}
