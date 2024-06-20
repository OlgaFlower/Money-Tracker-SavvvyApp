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
    // MARK: - Environment
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.dismiss) var dismiss
    
    // MARK: - State
    @ObservedObject var viewModel: MakeNewMoneyRecordViewModel
    @FocusState var isKeyboardFocused: Bool
    @FocusState var isCurrencyKeyboardFocused: Bool
    @State var isIconGroupsViewPresented: Bool = false
    
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
                self.viewModel.setDefaultValues()
            }, label: {
                Text(RecordType.expense.value)
                    .font(.title3.monospaced())
                    .opacity(self.viewModel.newItem.recordType == .expense ? 1 : 0.5)
            })
            
            Spacer()
            Rectangle()
                .frame(width: 0.5)
            Spacer()
            
            /// Income
            Button(action: {
                Constants.vibrateLight()
                self.viewModel.newItem.recordType = .income
                self.viewModel.setDefaultValues()
            }, label: {
                Text(RecordType.income.value)
                    .font(.title3.monospaced())
                    .opacity(self.viewModel.newItem.recordType == .income ? 1 : 0.5)
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
            if self.viewModel.newItem.notes.isEmpty {
                Text("Description")
                    .font(.title3.monospaced())
                    .foregroundStyle(.white.opacity(0.4))
            }
            
            TextField("", text: self.$viewModel.newItem.notes, axis: .vertical)
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
                    self.isIconGroupsViewPresented.toggle()
                }
                .sheet(isPresented: self.$isIconGroupsViewPresented) {
                    CategoryGroupSelectionView(
                        recordType: self.$viewModel.newItem.recordType,
                        selectedCategory: self.$viewModel.newItem.category)
                }
        }
        .padding(.horizontal, 60)
    }
    
    /// SAVE
    private var saveButtonView: some View {
        Button {
            self.viewModel.saveNewRecord(context: self.viewContext)
            self.viewModel.shortVibrate()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.viewModel.shortVibrate()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.dismiss()
                }
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
        .disabled(!self.viewModel.isSaveBtnActive())
        .animation(.easeInOut(duration: 0.3), value: self.viewModel.isSaveBtnActive())
        .background {
            /// Border
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(.white.opacity(self.viewModel.isSaveBtnActive() ? 1 : 0.4), lineWidth: 1)
                .fill(.white.opacity(self.viewModel.isSaveBtnActive() ? 0.1 : 0))
        }
        /// Shadow
        .shadow(color: .black.opacity(self.viewModel.isSaveBtnActive() ? 0 : 0.4), radius: 1, x: 1, y: 1)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

// MARK: - Preview
#Preview {
    MakeNewMoneyRecordView(viewModel: MakeNewMoneyRecordViewModel())
}
