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
                    self.segmentedControlView
                    
                    self.moneyAmountView
                    self.categoryButton
                    self.recurringButton
                    
                    self.recurringDateSelector
                    self.descriptionView
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
    
    private var categoryButton: some View {
        SelectorButtonView(
            title: "Regular",
            iconName: "cart.circle.fill",
            isSelected: Binding(
                get: { self.viewModel.isRegularCatSelected },
                set: { _ in }
            ),
            action: ({
                // TODO: -
            })
        )
    }
    
    private var recurringButton: some View {
        SelectorButtonView(
            title: "Recurring",
            iconName: "repeat.circle.fill",
            isSelected: Binding(
                get: { self.viewModel.isRecurringCatSelected },
                set: { _ in }
            ),
            action: ({
                // TODO: -
            })
        )
    }
    
    private var recurringDateSelector: some View {
        RecurringRangeSelectorView(
            recurringRange: self.$viewModel.recurringRange) {
                self.viewModel.reduceRange()
            } onPlusTap: {
                self.viewModel.increaseRange()
            }
    }
    
    private var descriptionView: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 12.0)
                .fill(Color(.secondarySystemBackground))
                .frame(height: 44)
            VStack {
                TextField("Add more details...", text: $descriptionText)
                    .padding(.horizontal)
                    .autocorrectionDisabled(true)
                    .frame(width: UIScreen.main.bounds.width - 24, height: 44)
                    .keyboardType(.asciiCapable)
                    .focused($isKeyboardActive)
            }
        }
    }
    
    private var saveBtn: some View {
        VStack {
            Spacer()
            PinkButtonView(title: "Save") {
                // TODO: -
            }
            .frame(width: 120, height: 44)
            .padding(.bottom, 24)
        }
        .transition(.move(edge: .bottom))
    }
}

// MARK: - Preview
#Preview {
    NewRecordView(onDismiss: {})
}
