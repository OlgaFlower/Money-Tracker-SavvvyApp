//
//  CategoryGroupSelectionView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 14.05.24.
//

import SwiftUI

struct CategoryGroupSelectionView: View {
    // MARK: - Environment -
    @Environment(\.dismiss) var dismiss
    
    // MARK: - State -
    @Binding var recordType: RecordType
    @Binding var selectedCategory: Category
    
    // MARK: - Body -
    var body: some View {
        ZStack {
            BackgroundGradView()
            VStack {
                Spacer()
                Button(action: {
                    self.dismiss()
                }, label: {
                    Image(systemName: "chevron.compact.down")
                        .font(Font.system(size: 28))
                        .opacity(0.8)
                })
                    .padding(.bottom, 32)
                
            }
                    switch self.recordType {
                    case .expense:
                        /// EXPENSES
                        VStack(spacing: 40) {
                            /// General
                            BigButtonCategorySelectionView(
                                title: "GENERAL",
                                icon: "basket"
                            )
//                            .fullScreenCover(isPresented: self.$isCategoriesViewPresented) {
//                                CategoriesGridView(
//                                    moneyGroupType: .generalExpense,
//                                    viewModel: CategoriesGridViewModel(),
//                                    selectedCategory: self.$selectedCategory
//                                )
//                            }
                            /// Recurring
                            BigButtonCategorySelectionView(
                                title: "RECURRING",
                                icon: "arrow.clockwise"
                            )
                        }
                        .padding(.bottom, 32)
                        
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
//                        .padding(.bottom, 32)
                    }
//                }
            }
        .foregroundStyle(.white)
//            Spacer()
//        }
//        .foregroundStyle(.white)
    }
    
    // MARK: - Views -
    
//    private func makeIncomeView(
//        title: String,
//        items: MoneyCategories,
//        selectedCategory: Binding<Category>
//    ) -> some View {
//        VStack {
//                self.makeTitleView(title: title)
//                    .padding(.top, 24)
//                
//                CategoriesGridView(
//                    categories: items,
//                    selectedCategory: selectedCategory)
//            
//        }
//    }
    
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
    CategoryGroupSelectionView(
        recordType: .constant(.expense),
        selectedCategory: .constant(.init(moneyGroupType: .regularIncome,
                                          name: RegularIncome.salary.string,
                                          icon: RegularIncome.salary.icon)
        )
    )
}
