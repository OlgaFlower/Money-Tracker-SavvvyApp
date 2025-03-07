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
    
    var onDismiss: () -> Void
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 11) {
                    
                    CancelButtonView {
                        onDismiss()
                    }
                    .padding(.bottom, 24)
                    self.segmentedControlView
                    
                    self.moneyAmountView
                    self.categorySelector
                    self.recurringSelector
                    
                    if self.viewModel.regularCatSelected {
                        self.recurringDateRangeSelector
                    }
                    
                    DescriptionView(text: self.$descriptionText)
                        .padding(.top, 24)
                    Spacer()
                }
                .padding(.horizontal, 24)
            }
            if !isKeyboardActive {
                self.saveBtn
            }
        }
    }
    
    // MARK: - Views
    private var segmentedControlView: some View {
        CustomSegmentedControlView(
            tag: self.$preselectedTag,
            controlOptions: ["Expense", "Income"]
        )
    }
    
    // TODO: textfield for currency
    private var moneyAmountView: some View {
        HStack {
            Text("50.00")
                .font(.system(size: 60, weight: .bold, design: .default))
            Text(" \(self.viewModel.currencySign)")
                .font(.system(size: 35, weight: .bold, design: .default))
                .foregroundStyle(.tertiary)
        }
        .padding(.vertical)
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
