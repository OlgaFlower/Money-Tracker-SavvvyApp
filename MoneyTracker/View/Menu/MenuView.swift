//
//  NewRecordSelectionView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 02.04.24.
//

import SwiftUI

struct MenuView: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        
        VStack {
            ZStack {
                VStack(spacing: 8) {
                    /// Small Expenses
                    self.makeMenuItem(type: .smallExpense)
                    self.separatorView
                    /// Large Expense
                    self.makeMenuItem(type: .largeExpense)
                    self.separatorView
                    /// Recurring Expense
                    self.makeMenuItem(type: .recurringExpense)
                    self.separatorView
                    /// Income
                    self.makeMenuItem(type: .income)
                }
                .padding(.vertical)
                .background(Color.white.opacity(0.6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .foregroundStyle(.mainNavy)
        .frame(width: UIScreen.main.bounds.width * 0.6)
    }
    
    // MARK: - Views
    private func makeMenuItem(type: MenuRecordItem) -> some View {
        VStack {
            HStack(spacing: 18) {
                ZStack {
                    LinearGradient(colors: [.green, .cyan, .cyan ,.indigo], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .frame(width: 40, height: 40)
                        .clipShape(.rect(cornerRadius: 10))
                    Image(type.icon)
                }
                Button(action: {
                    print(type.title)
                }, label: {
                    Text(type.title)
                        .fontWeight(.medium)
                })
                Spacer()
            }
            .padding(.leading, 18)
        }
    }
    
    private var separatorView: some View {
        Rectangle()
            .frame(height: 0.5)
            .opacity(0.6)
            .padding(.leading, 18)
    }
    
    // MARK: - Functions
    func addSmallExpense() {
        
    }
    func addLargeExpense() {
        
    }
    func addRecurringExpense() {
        
    }
    func addIncome() {
        
    }
}

#Preview {
    MenuView()
}
