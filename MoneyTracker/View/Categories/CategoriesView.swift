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
    private let regularIncomeCategories: MoneyCategories = {
        Categories.fetchRegularIncomeCategories()
    }()
    
    private let temporaryIncomeCategories: MoneyCategories = {
        Categories.fetchTemporaryIncomeCategories()
    }()
    
    private let generalExpenses: MoneyCategories = {
        Categories.fetchGeneralExpensesItems()
    }()
    
    private let recurringCategories: [RecurringCategories] = {
        Categories.fetchRecurringExpenses()
    }()
    
    // MARK: - Body -
    var body: some View {
        ZStack {
            BackgroundGradView()
                    switch self.recordType {
                    case .expense:
                        VStack(spacing: 40) {
                            /// GENERAL EXPENSES
                            BigButtonCategorySelectionView(
                                title: "GENERAL",
                                icon: "basket",
                                shouldRotate: self.$isGeneralExpensesShowing
                            )
                                .onTapGesture {
                                    withAnimation {
                                        self.isGeneralExpensesShowing.toggle()
                                    }
                                }
                            
//                            if self.isGeneralExpensesShowing {
//                                CategoriesGridView(
//                                    categories: self.generalExpenses,
//                                    selectedCategory: self.$selectedCategory
//                                )
//                                .padding(.vertical)
//                            }
                            
                            /// RECURRING EXPENSES
                            BigButtonCategorySelectionView(
//                                title: MoneyGroupType.recurringExpense.string,
                                title: "RECURRING", 
                                icon: "arrow.clockwise",
                                shouldRotate: self.$isRecurringExpensesShowing
                            )
                                .onTapGesture {
                                    withAnimation {
                                        self.isRecurringExpensesShowing.toggle()
                                    }
                                }
                            
//                            if self.isRecurringExpensesShowing {
//                                ForEach(self.recurringCategories, id: \.self) { categories in
                                    
//                                    self.makeRecurringTitleView(
//                                        title: categories.sectionTitle,
//                                        icon: categories.categoryItems.first?.icon ?? ""
//                                    )
//                                    .padding(.top, 12)
                                    
//                                    CategoriesCellView(
//                                        categories: categories.categoryItems,
//                                        selectedCategory: self.$selectedCategory
//                                    )
//                                }
//                            }
                        }
                        
                        /// INCOME
                    case .income:
                        VStack {
//                            self.makeIncomeView(
//                                title: MoneyGroupType.regularIncome.string,
//                                items: self.regularIncomeCategories,
//                                selectedCategory: self.$selectedCategory)
//                            
//                            self.makeIncomeView(
//                                title: MoneyGroupType.temporaryIncome.string,
//                                items: self.temporaryIncomeCategories,
//                                selectedCategory: self.$selectedCategory)
                        }
//                        .padding(.bottom, 24)
                    }
//                }
            }
        .foregroundStyle(.white)
//            Spacer()
//        }
//        .foregroundStyle(.white)
    }
    
    // MARK: - Views -
    
    private func makeIncomeView(
        title: String,
        items: MoneyCategories,
        selectedCategory: Binding<Category>
    ) -> some View {
        VStack {
                self.makeTitleView(title: title)
                    .padding(.top, 24)
                
                CategoriesGridView(
                    categories: items,
                    selectedCategory: selectedCategory)
            
        }
    }
    
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
    CategoriesView(
        recordType: .constant(.expense),
        selectedCategory: .constant(.init(moneyGroupType: .regularIncome,
                                          name: RegularIncome.salary.string,
                                          icon: RegularIncome.salary.icon)
        )
    )
}
