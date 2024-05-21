//
//  CategoriesView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 14.05.24.
//

import SwiftUI

struct CategoriesView: View {
    
    // MARK: - State -
    @Binding var recordType: RecordType
    @Binding var selectedCategory: Category
    @State var isGeneralExpensesShowing: Bool = false
    @State var isRecurringExpensesShowing: Bool = false
    @State var shouldRotate: Bool = false
    
    // MARK: - Properties
    private let incomeCategories: [MoneyCategories] = {
        Categories.fetchIncomeCategories()
    }()
    
    private let expenseCategories: [Category] = {
        Categories.fetchExpenseCategories()
    }()
    
    private let recurringCategories: [MoneyCategories] = {
        Categories.fetchRecurringExpenseCategories()
    }()
    
    private let fixedColumn = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]
    
    // MARK: - Body -
    var body: some View {
        ZStack {
            BackgroundGradView()
            VStack {
                ScrollView(showsIndicators: false) {
                    switch self.recordType {
                    case .expense:
                        VStack {
                            /// GENERAL EXPENSES
                            DropDownMenuButtonView(
                                title: "General Expenses",
                                shouldRotate: self.$isGeneralExpensesShowing
                            )
                                .padding(.top, 32)
                                .onTapGesture {
                                    withAnimation {
                                        self.isGeneralExpensesShowing.toggle()
                                    }
                                }
                            
                            if self.isGeneralExpensesShowing {
                                CategoriesGridView(categories: self.expenseCategories, selectedCategory: self.$selectedCategory)
                                .padding(.vertical)
                            }
                            
                            /// RECURRING EXPENSES
                            DropDownMenuButtonView(
                                title: "Recurring Expenses",
                                shouldRotate: self.$isRecurringExpensesShowing
                            )
                                .onTapGesture {
                                    withAnimation {
                                        self.isRecurringExpensesShowing.toggle()
                                    }
                                }
                            
                            if self.isRecurringExpensesShowing {
                                ForEach(self.recurringCategories, id: \.self) { categories in
                                    
                                    self.makeRecurringTitleView(
                                        title: categories.title,
                                        icon: categories.categoryItems.first?.iconName ?? ""
                                    )
                                    .padding(.top, 12)
                                    
                                    CategoriesCellView(
                                        categories: categories.categoryItems,
                                        selectedCategory: self.$selectedCategory
                                    )
                                }
                            }
                        }
                        
                        /// INCOME
                    case .income:
                        VStack {
                            ForEach(self.incomeCategories, id: \.self) { categories in
                                
                                self.makeTitleView(title: categories.title)
                                    .padding(.top, 24)
                                
                                CategoriesGridView(
                                    categories: categories.categoryItems,
                                    selectedCategory: self.$selectedCategory)
                            }
                        }
                        .padding(.bottom, 24)
                    }
                }
            }
            Spacer()
        }
        .foregroundStyle(.white)
    }
    
    // MARK: - Views -
    
    private func makeRecurringTitleView(title: String, icon: String) -> some View {
        VStack {
            HStack {
                Label(title, systemImage: icon)
                    .font(.title3)
                Spacer()
            }
            .padding(.leading, 40)
            
            Rectangle()
                .frame(height: 0.5)
                .background(Color.white)
                .padding(.leading, 35)
        }
    }
    
    private func makeTitleView(title: String) -> some View {
        HStack {
            Text(title)
                .font(.title3.monospaced())
                .multilineTextAlignment(.leading)
                .padding(.leading, 40)
            Spacer()
        }
    }
}

#Preview {
    CategoriesView(recordType: .constant(.expense), selectedCategory: .constant(.init(name: "Salary", iconName: "sun.max")))
}
