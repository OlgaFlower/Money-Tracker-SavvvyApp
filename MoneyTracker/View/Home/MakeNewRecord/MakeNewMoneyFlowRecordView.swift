//
//  MakeNewMoneyFlowRecordView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 04.04.24.
//

import SwiftUI
import Combine

struct MakeNewMoneyFlowRecordView: View {
    // MARK: - Properties
    @Environment(\.dismiss) var dismiss
    @FocusState var isKeyboardFocused: Bool
    @FocusState var isCurrencyTextFieldKeyboardFocused: Bool
    @State private var recordType: RecordType = .expense
    @State private var incomeMoneyValue: String = "0,00"
    @State private var description: String = ""
    @State var iconName: String = Icons.list.first?.name ?? ""
    
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
                
                /// Income Money
                CurrencyTextFieldView(
                    isKeyboardFocused: _isCurrencyTextFieldKeyboardFocused,
                    currency: "UAH"
                )
                
                /// Description
                self.descriptionTextField
                
                /// Icon
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
    
//    private var incomeMoneyTextField: some View {
//        TextField(self.incomeMoneyValue, text: self.$incomeMoneyValue)
//            .onSubmit {
//                self.isKeyboardFocused = false
//            }
//            .keyboardType(.numberPad)
//            .focused(self.$isKeyboardFocused)
//            .frame(height: 50)
//            .multilineTextAlignment(.center)
//            .font(.title.monospaced())
//            .autocorrectionDisabled(true)
//            .background(Color.lightBlue.opacity(0.4))
//            .onReceive(Just(incomeMoneyValue)) { _ in
//                if incomeMoneyValue.count > 18 {
//                    incomeMoneyValue = String(incomeMoneyValue.prefix(18))
//                }
//            }
//    }
    
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
        HStack(spacing: 0) {
            /// Icon
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(
                        .linearGradient(colors: Constants.gradientForIcon, startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .stroke(.white.opacity(0.4), lineWidth: 0.5)
                    .frame(width: 45, height: 45)
                
                Image(systemName: self.iconName)
                    .font(.title)
            }
            Spacer()
            /// Category
            Text("Category")
                .font(.title3.monospaced())
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding(.horizontal, 60)
    }
}

// MARK: - Preview
#Preview {
    MakeNewMoneyFlowRecordView()
}
