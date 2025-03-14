////
////  CategoryGroupSelectionView.swift
////  MoneyTracker
////
////  Created by Olha Bereziuk on 14.05.24.
////
//
//import SwiftUI
//
//struct CategoryGroupSelectionView: View {
//    // MARK: - Type
//    enum Position {
//        case top
//        case bottom
//    }
//    
//    // MARK: - Environment -
//    @Environment(\.dismiss) var dismiss
//    
//    // MARK: - State -
//    @Binding var recordType: RecordType
//    @Binding var selectedCategory: Category
//    @State private var showIconsList = false
//    
//    // MARK: - Body -
//    var body: some View {
//        ZStack {
//            BackgroundGradView()
//            self.makeIconList()
//            self.makeRecurringList()
//            
//            switch self.recordType {
//            case .expense:
//                //MARK: - EXPENSES
//                /// -GENERAL-
//                BigButtonCategorySelectionView(
//                    hideRectangle: self.$showIconsList,
//                    title: "GENERAL",
//                    icon: "basket"
//                )
//                .opacity(
//                    self.makeOpacity(
//                        moneyType: .generalExpense
//                    )
//                )
//                .position(
//                    self.makePositioning(
//                        position: .top,
//                        moneyType: .generalExpense
//                    )
//                )
//                .onTapGesture {
//                    VibrateService.vibrateLight()
//                    self.selectedCategory.moneyGroupType = .generalExpense
//                    self.showIconsList.toggle()
//                }
//                
//                /// -RECURRING-
//                BigButtonCategorySelectionView(
//                    hideRectangle: self.$showIconsList,
//                    title: "RECURRING",
//                    icon: "arrow.clockwise"
//                )
//                .opacity(
//                    self.makeOpacity(
//                        moneyType: .recurringExpense
//                    )
//                )
//                .position(
//                    self.makePositioning(
//                        position: .bottom,
//                        moneyType: .recurringExpense
//                    )
//                )
//                .onTapGesture {
//                    VibrateService.vibrateLight()
//                    self.showIconsList.toggle()
//                    self.selectedCategory.moneyGroupType = .recurringExpense
//                }
//                
//                //MARK: - INCOME
//            case .income:
//                    /// -REGULAR-
//                    BigButtonCategorySelectionView(
//                        hideRectangle: self.$showIconsList,
//                        title: "REGULAR",
//                        icon: "bag"
//                    )
//                    .opacity(
//                        self.makeOpacity(
//                            moneyType: .regularIncome
//                        )
//                    )
//                    .position(
//                        self.makePositioning(
//                            position: .top,
//                            moneyType: .regularIncome
//                        )
//                    )
//                    .onTapGesture {
//                        VibrateService.vibrateLight()
//                        self.showIconsList.toggle()
//                        self.selectedCategory.moneyGroupType = .regularIncome
//                    }
//                    
//                    /// -TEMPORARY-
//                    BigButtonCategorySelectionView(
//                        hideRectangle: self.$showIconsList,
//                        title: "TEMPORARY",
//                        icon: "bubbles.and.sparkles"
//                    )
//                    .opacity(
//                        self.makeOpacity(
//                            moneyType: .temporaryIncome
//                        )
//                    )
//                    .position(
//                        self.makePositioning(
//                            position: .bottom,
//                            moneyType: .temporaryIncome
//                        )
//                    )
//                    .onTapGesture {
//                        VibrateService.vibrateLight()
//                        self.showIconsList.toggle()
//                        self.selectedCategory.moneyGroupType = .temporaryIncome
//                    }
//            }
//        }
//        .foregroundStyle(.white)
//        .animation(.easeInOut(duration: 0.4), value: self.showIconsList)
//        .animation(.easeInOut(duration: 0.4), value: self.selectedCategory)
//    }
//    
//    // MARK: - Functions -
//    
//    private func makePositioning(position: Position, moneyType: MoneyGroupType) -> CGPoint {
//        switch position {
//        case .top:
//            return (self.showIconsList && self.selectedCategory.moneyGroupType == moneyType) ? CGPoint(x: 108, y: 40) : CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 4 + 80)
//        case .bottom:
//            return (self.showIconsList && self.selectedCategory.moneyGroupType == moneyType) ? CGPoint(x: 108, y: 40) : CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2 + 80)
//        }
//    }
//    
//    private func makeOpacity(moneyType: MoneyGroupType) -> Double {
//        return (self.selectedCategory.moneyGroupType
//                != moneyType && self.showIconsList) ? 0 : 1
//    }
//    
//    // MARK: - Views -
//    @ViewBuilder
//    private func makeIconList() -> some View {
//        if self.selectedCategory.moneyGroupType != .recurringExpense && self.selectedCategory.moneyGroupType != .none {
//            ScrollView {
//                CategoriesGridView(
//                    moneyGroupType: self.selectedCategory.moneyGroupType,
//                    viewModel: CategoriesGridViewModel(),
//                    selectedCategory: self.$selectedCategory
//                )
//                .padding(.vertical, 30)
//            }
//            .animation(.easeInOut(duration: 0.4), value: self.showIconsList)
//            .padding(.top, 64)
//            .scrollIndicators(.hidden)
//            .offset(x: self.showIconsList ? 0 : -UIScreen.main.bounds.width)
//        }
//    }
//    
//    @ViewBuilder
//    private func makeRecurringList() -> some View {
//        if self.selectedCategory.moneyGroupType == .recurringExpense {
//            ScrollView {
//                RecurringCategoryCellView(
//                    viewModel: RecurringCategoryCellViewModel(),
//                    selectedCategory: self.$selectedCategory
//                )
//                .padding(.vertical, 30)
//            }
//            .animation(.easeInOut(duration: 0.4), value: self.showIconsList)
//            .padding(.top, 64)
//            .scrollIndicators(.hidden)
//            .offset(x: self.showIconsList ? 0 : -UIScreen.main.bounds.width)
//        }
//    }
//}
//
//#Preview {
//    CategoryGroupSelectionView(
//        recordType: .constant(.expense),
//        selectedCategory: .constant(.init(moneyGroupType: .regularIncome,
//                                          name: RegularIncome.salary.string,
//                                          icon: RegularIncome.salary.icon)
//        )
//    )
//}
