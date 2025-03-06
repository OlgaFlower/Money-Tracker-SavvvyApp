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
    @State private var preselectedTag: Int = 0
    @State private var descriptionText: String = ""
    
    // MARK: - Actions
    var onDismiss: () -> Void
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            self.backgroundView
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 11) {
                    
                    self.cancelButton
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
        }
    }
    
    // MARK: - Views
    private var backgroundView: some View {
        Rectangle()
            .ignoresSafeArea()
            .foregroundStyle(.background)
    }
    
    private var cancelButton: some View {
        HStack {
            Spacer()
            Image(systemName: "xmark.circle.fill")
                .font(.system(size: 25, weight: .regular, design: .default))
                .foregroundStyle(Color(hex: "E3E3E5"))
        }
        .padding(.top, 24)
        .onTapGesture {
            onDismiss()
        }
    }
    
    private var segmentedControlView: some View {
        CustomSegmentedControl(
            tag: self.$preselectedTag,
            controlOptions: ["Expense", "Income"]
        )
        .padding(.vertical, 13)
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
            title: "Category",
            systemIconName: "repeat.circle.fill",
            action: ({
                // TODO: -
            })
        )
    }
    
    private var recurringButton: some View {
        SelectorButtonView(
            title: "Recurring",
            systemIconName: "repeat.circle.fill",
            action: ({
                // TODO: -
            })
        )
    }
    
    private var recurringDateSelector: some View {
        HStack {
            Image(systemName: "chevron.left")
                .foregroundStyle(.pink)
                .onTapGesture {
                    VibrateService.vibrateMedium()
                }
            
            Spacer()
            
            Text("Every")
            
            Text("\(self.viewModel.recurringNumber)")
                .font(.system(size: 18, weight: .medium, design: .default))
                .foregroundStyle(.blue)
            
            Text("Days")
                .padding(.trailing, 4)
                .font(.system(size: 16, weight: .medium, design: .default))
            
            self.plusMinusButton
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundStyle(.pink)
                .onTapGesture {
                    VibrateService.vibrateMedium()
                }
            
        }
        .padding(.vertical)
        .padding(.horizontal)
    }
    
    private var plusMinusButton: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.background.secondary)
                .frame(width: 88, height: 44)
            
            HStack(spacing: 0) {
                Image(systemName: "minus")
                    .frame(width: 43)
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .onTapGesture {
                        VibrateService.vibrateMedium()
                    }
                
                self.verticalDevider
                
                Image(systemName: "plus")
                    .frame(width: 43)
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .onTapGesture {
                        VibrateService.vibrateMedium()
                    }
            }
        }
    }
    
    private var verticalDevider: some View {
        HStack(spacing: 0) {
            Rectangle()
                .frame(width: 1)
                .foregroundStyle(.primary.opacity(0.25))
            Rectangle()
                .frame(width: 1.5)
                .foregroundStyle(.primary.opacity(0.1))
        }
        .frame(width: 2, height: 30)
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
            }
        }
    }
}

// MARK: - Preview
#Preview {
    NewRecordView(onDismiss: {})
}
