//
//  HorizontalBudgetBoardView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 26.06.24.
//

import SwiftUI

struct HorizontalBudgetBoardView: View {
    // MARK: - State
    @Binding var showingAlert: Bool
    @Binding var isDetailCellViewPresented: Bool
    
    // MARK: - Properties
    var animatedExpenses: Int
    var animatedBudget: Double
    private let infoBoardWidth = Constants.screenWidth / 2.8
    
    // MARK: - Body
    var body: some View {
        HStack {
            self.spentView
            self.verticalDevider
            self.budgetView
        }
    }
    
    // MARK: - Views
    private var spentView: some View {
        VStack(spacing: 18) {
            HStack {
                Spacer()
                Text("SPENT")
                    .font(.customFont(style: .regular, size: .body))
                    .foregroundStyle(.white)
            }
            .padding(.trailing, 30)
            
            HStack {
                Spacer()
                Text(self.animatedExpenses.toString().formatAsCurrency())
                    .font(.customFont(style: .regular, size: .title))
                    .foregroundStyle(.white.opacity(0.8))
                    .contentTransition(.numericText())
                    .animation(.linear, value: self.animatedExpenses)
            }
            .padding(.trailing, 16)
        }
        .frame(width: self.infoBoardWidth)
        .onTapGesture {
            Constants.vibrateLight()
            self.animatedExpenses == 0 ? self.showingAlert.toggle() : self.isDetailCellViewPresented.toggle()
        }
        .sheet(isPresented: self.$isDetailCellViewPresented, content: {
            ExpensesDetailView()
        })
        .alert("No expenses yet", isPresented: self.$showingAlert) {
            Button("OK", role: .cancel) {}
        }
    }
    
    private var verticalDevider: some View {
        Rectangle()
            .frame(width: 1, height: 80)
            .foregroundStyle(.white.opacity(0.3))
            .padding(.horizontal, 12)
    }
    
    private var budgetView: some View {
        VStack(spacing: 18) {
            HStack {
                Text("BUDGET")
                    .font(.customFont(style: .regular, size: .body))
                    .foregroundStyle(.white)
                Spacer()
            }
            .padding(.leading, 30)
            
            HStack {
                Text(String(describing: self.animatedBudget).formatAsCurrency())
                    .font(.customFont(style: .regular, size: .title))
                    .foregroundStyle(.white.opacity(0.8))
                    .contentTransition(.numericText())
                    .animation(.linear, value: self.animatedBudget)
                Spacer()
            }
            .padding(.leading, 30)
        }
        .frame(width: self.infoBoardWidth)
        .onTapGesture {
            Constants.vibrateLight()
        }
    }
}

#Preview {
    HorizontalBudgetBoardView(
        showingAlert: .constant(false),
        isDetailCellViewPresented: .constant(false),
        animatedExpenses: 0,
        animatedBudget: 0.0
    )
}
