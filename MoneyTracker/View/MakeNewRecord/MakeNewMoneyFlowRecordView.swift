//
//  MakeNewMoneyFlowRecordView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 04.04.24.
//

import SwiftUI
import Combine

struct MakeNewMoneyFlowRecordView: View {
    // MARK: - Environment -
    @Environment(\.dismiss) var dismiss
    
    // MARK: - State -
    @FocusState var isKeyboardFocused: Bool
    @FocusState var isCurrencyTextFieldKeyboardFocused: Bool
    @State private var recordType: RecordType = .expense
    @State private var selectedCategory = Category(name: "Category", iconName: "sun.min")
    @State private var showCategoriesView = false
    @State private var inputMoney: String = ""
    @State private var description: String = ""
    
    // MARK: - Body
    var body: some View {
        ZStack {
            BackgroundGradView()
            VStack(spacing: 32) {
                /// Cancel
                self.cancelButton
                    .padding(.horizontal, 24)
                
                /// Expense / Income
                self.typeSelectionView
                
                /// Money Field
                CurrencyTextFieldView(
                    isKeyboardFocused: _isCurrencyTextFieldKeyboardFocused, inputAmount: $inputMoney,
                    currency: "UAH"
                )
                
                /// Description
                self.descriptionTextField
                
                /// Category
                self.categorySelectionView
                
                Spacer()
            }
            .foregroundStyle(.white)
            .padding(.top, 32)
        }
        .onTapGesture {
            self.isKeyboardFocused = false
            self.isCurrencyTextFieldKeyboardFocused = false
        }
    }
    
    // MARK: - Views
    private var cancelButton: some View {
        HStack {
            Spacer()
            Button(action: {
                self.dismiss()
            }, label: {
                Image(systemName: "plus")
                    .font(Font.system(size: 28))
                    .opacity(0.8)
                    .rotationEffect(.degrees(45))
            })
        }
    }
    
    private var typeSelectionView: some View {
        HStack {
            /// Expense
            Button(action: {
                self.recordType = .expense
            }, label: {
                Text(RecordType.expense.value)
                    .font(.title3.monospaced())
                    .opacity(self.recordType == .expense ? 1 : 0.4)
            })
            Spacer()
            Rectangle()
                .frame(width: 0.5)
            Spacer()
            /// Income
            Button(action: {
                self.recordType = .income
            }, label: {
                Text(RecordType.income.value)
                    .font(.title3.monospaced())
                    .opacity(self.recordType == .income ? 1 : 0.4)
            })
        }
        .frame(height: 24)
        .padding(.horizontal, 60)
    }
    
    private var descriptionTextField: some View {
        ZStack {
            /// Background
            Rectangle()
                .foregroundStyle(Color.lightBlue.opacity(0.4))
                .frame(height: 92)
            /// Placeholder
            if self.description.isEmpty {
                Text("Description")
                    .font(.title3.monospaced())
                    .foregroundStyle(.white.opacity(0.4))
            }
            
            TextField("", text: self.$description, axis: .vertical)
                .onSubmit {
                    self.isKeyboardFocused = false
                }
                .focused(self.$isKeyboardFocused)
                .font(.title3.monospaced())
                .padding(.horizontal)
                .padding(.vertical, 6)
                .lineLimit(1...3)
                .autocorrectionDisabled(true)
                .frame(width: UIScreen.main.bounds.width - 24)
        }
    }
    
    private var categorySelectionView: some View {
        HStack(spacing: 32) {
            /// Icon
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(
                        .linearGradient(colors: Constants.gradientForIcon, startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .stroke(.white.opacity(0.4), lineWidth: 0.5)
                    .frame(width: 45, height: 45)
                
                Image(systemName: self.selectedCategory.iconName)
                    .font(.title)
            }
            
            /// Category
            Text(self.selectedCategory.name)
                .font(.title3.monospaced())
                .onTapGesture {
                    self.showCategoriesView.toggle()
                }
                .sheet(isPresented: self.$showCategoriesView, content: {
                    CategoriesView(recordType: $recordType, selectedCategory: $selectedCategory)
                })
            
            Spacer()
        }
        .padding(.horizontal, 60)
        
    }
}

// MARK: - Preview
#Preview {
    MakeNewMoneyFlowRecordView()
}