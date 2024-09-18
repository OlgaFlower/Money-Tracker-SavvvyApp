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
    @State private var budgetTextDisplayed = false
    
    // MARK: - Properties
    var animatedExpenses: Int
    var animatedBudget: Double
    private let infoBoardWidth = Constants.screenWidth / 2.8
    private let budgetText = "The daily budget consists of all revenues deposited in the current month and, if available, the positive balance from the previous month."
    
    /// This clouser helps ExpensesDetailView (grand child view) to run an animation func from HomeView (parent view)
    /// in the certain time after editing and dismissing ExpensesDetailView.
    var updateAnimatedValues: () -> Void
    
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
                    .foregroundStyle(.white.opacity(0.9))
                    .contentTransition(.numericText())
                    .animation(.linear, value: self.animatedExpenses)
            }
            .padding(.trailing, 22)
        }
        .frame(width: self.infoBoardWidth)
        .onTapGesture {
            VibrateService.vibrateLight()
            self.animatedExpenses == 0 ? self.showingAlert.toggle() : self.isDetailCellViewPresented.toggle()
        }
        .sheet(isPresented: self.$isDetailCellViewPresented, 
               content: {
            ExpensesDetailView(updateAnimatedValues: self.updateAnimatedValues)
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
                    .foregroundStyle(.white.opacity(0.9))
                    .contentTransition(.numericText())
                    .animation(.linear, value: self.animatedBudget)
                Spacer()
            }
            .padding(.leading, 30)
        }
        .frame(width: self.infoBoardWidth)
        .onTapGesture {
            VibrateService.vibrateLight()
            self.budgetTextDisplayed.toggle()
        }
        .alert(self.budgetText, isPresented: self.$budgetTextDisplayed) {
            Button("OK", role: .cancel) {}
        }
    }
}

#Preview {
    HorizontalBudgetBoardView(
        showingAlert: .constant(false),
        isDetailCellViewPresented: .constant(false),
        animatedExpenses: 0,
        animatedBudget: 0.0, 
        updateAnimatedValues: {}
    )
}
