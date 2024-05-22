//
//  MakeNewMoneyRecordView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 04.04.24.
//

import SwiftUI
import Combine
import CoreData

struct MakeNewMoneyRecordView: View {
    // MARK: - Environment -
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.dismiss) var dismiss
    
    // MARK: - State -
    @ObservedObject var viewModel: MakeNewMoneyRecordViewModel
    @FocusState var isKeyboardFocused: Bool
    @FocusState var isCurrencyKeyboardFocused: Bool
    @State var isGroupTypeSelectionViewPresented: Bool = false
    @State var selectedCategory = Category(moneyGroupType: .generalExpense, name: "", icon: "")
    
    // MARK: - Body
    var body: some View {
        ZStack {
            BackgroundGradView()
            VStack(spacing: 32) {
                /// Cancel
                self.cancelButton
                    .padding(.horizontal, 24)
                
                /// Expense / Income
                self.moneyTypeSelectionView
                
                /// Money Field
                CurrencyTextFieldView(
                    isKeyboardFocused: _isCurrencyKeyboardFocused, 
                    inputAmount: self.$viewModel.newItem.moneyAmount,
                    currency: self.viewModel.newItem.currency
                )
                
                /// Description
                self.descriptionTextField
                
                /// Category
                self.categorySelectionView
                
                /// Save
                Spacer()
                self.saveButtonView
                Spacer()
            }
            .foregroundStyle(.white)
            .padding(.top, 32)
        }
        .onTapGesture {
            self.isKeyboardFocused = false
            self.isCurrencyKeyboardFocused = false
        }
        .onAppear {
            self.viewModel.prepareHaptics()
        }
    }
    
    // MARK: - Views
    /// CANCEL
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
    
    /// EXPENSE | INCOME
    private var moneyTypeSelectionView: some View {
        HStack {
            /// Expense
            Button(action: {
                Constants.vibrateLight()
                self.viewModel.newItem.recordType = .expense
            }, label: {
                Text(RecordType.expense.value)
                    .font(.title3.monospaced())
                    .opacity(self.viewModel.newItem.recordType == .expense ? 1 : 0.4)
            })
            
            Spacer()
            Rectangle()
                .frame(width: 0.5)
            Spacer()
            
            /// Income
            Button(action: {
                Constants.vibrateLight()
                self.viewModel.newItem.recordType = .income
            }, label: {
                Text(RecordType.income.value)
                    .font(.title3.monospaced())
                    .opacity(self.viewModel.newItem.recordType == .income ? 1 : 0.4)
            })
        }
        .frame(height: 24)
        .padding(.horizontal, 60)
    }
    
    /// DESCRIPTION
    private var descriptionTextField: some View {
        ZStack {
            /// Background
            Rectangle()
                .foregroundStyle(Color.lightBlue.opacity(0.4))
                .frame(height: 92)
            /// Placeholder
            if self.viewModel.newItem.description.isEmpty {
                Text("Description")
                    .font(.title3.monospaced())
                    .foregroundStyle(.white.opacity(0.4))
            }
            
            TextField("", text: self.$viewModel.newItem.description, axis: .vertical)
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
            /// ICON
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(
                        .linearGradient(colors: Constants.gradientForIcon, startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .stroke(.white.opacity(0.4), lineWidth: 0.5)
                    .frame(width: 45, height: 45)
                
                Image(systemName: self.viewModel.newItem.category.icon)
                    .font(.title)
            }
            
            /// CATEGORY
            Text(self.viewModel.newItem.category.name)
                .font(.title3.monospaced())
                .multilineTextAlignment(.leading)
                .opacity(self.viewModel.isCategoryChosen() ? 1 : 0.4)
                .onTapGesture {
                    Constants.vibrateLight()
                    self.isKeyboardFocused = false
                    self.isCurrencyKeyboardFocused = false
                    self.isGroupTypeSelectionViewPresented.toggle()
                }
                .fullScreenCover(isPresented: self.$isGroupTypeSelectionViewPresented) {
                    CategoryGroupSelectionView(
                        recordType: self.$viewModel.newItem.recordType,
                        selectedCategory: self.$selectedCategory)
                }
        }
        .padding(.horizontal, 60)
    }
    
    /// SAVE
    private var saveButtonView: some View {
        Button {
            if !self.viewModel.newItem.moneyAmount.isEmpty {
                self.viewModel.saveNewRecord(self.viewContext)
                
                self.viewModel.shortVibrate()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.viewModel.shortVibrate()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        self.dismiss()
                    }
                }
            } 
            else
            {
                /// Vibrate long
                self.viewModel.longVibrate()
            }
        } label: {
            Text("SAVE")
                .font(.title2)
                .fontDesign(.monospaced)
                .foregroundStyle(.white)
                .opacity(self.viewModel.isSaveBtnActive() ? 1 : 0.4)
                .padding(.vertical, 10)
                .frame(width: 130)
                .clipShape(.rect(cornerRadius: 10, style: .continuous))
        }
        .background {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(.white.opacity(0.6), lineWidth: 1)
        }
    }
}

// MARK: - Preview
#Preview {
    MakeNewMoneyRecordView(viewModel: MakeNewMoneyRecordViewModel())
}
