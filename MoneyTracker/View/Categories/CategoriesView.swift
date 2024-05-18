//
//  CategoriesView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 14.05.24.
//

import SwiftUI

struct CategoriesView: View {
    // MARK: - Environment -
    @Environment(\.dismiss) var dismiss
    
    // MARK: - State -
    @Binding var recordType: RecordType
    @Binding var selectedCategory: Category
    
    // MARK: - Properties
    private let incomeCategories = Categories.fetchIncomeCategoies()
    private let expenseCategories = Categories.fetchExpenseCategories()
    
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
                        LazyVGrid(columns: self.fixedColumn, spacing: 30) {
                            ForEach(self.expenseCategories, id: \.self) { item in
                                self.makeIconsGridView(item: item)
                            }
                        }
                        .padding(.vertical)
                        
                    case .income:
                        /// Permanent
                        self.makeTitleView(title: "Permanent")
                            .padding(.top, 24)
                        LazyVGrid(columns: self.fixedColumn, spacing: 30) {
                            ForEach(self.incomeCategories.permanent, id: \.self) { item in
                                self.makeIconsGridView(item: item)
                            }
                        }
                        .padding(.vertical)
                        
                        /// Temporary
                        self.makeTitleView(title: "Temporary")
                        LazyVGrid(columns: self.fixedColumn, spacing: 30) {
                            ForEach(self.incomeCategories.temporary, id: \.self) { item in
                                self.makeIconsGridView(item: item)
                            }
                        }
                        .padding(.vertical)
                    }
                }
            }
        }
    }
    
    // MARK: - Views -
    
    private func makeIconsGridView(item: Category) -> some View {
        VStack {
            Image(systemName: item.iconName)
                .frame(width: 80, height: 80, alignment: .center)
                .background(.blue)
                .cornerRadius(10)
            
            Text(item.name)
        }
        .frame(width: 100, height: 100)
        .foregroundStyle(.white)
        .onTapGesture {
            self.selectedCategory = item
            self.dismiss()
        }
    }
    
    private func makeTitleView(title: String) -> some View {
        HStack {
            Text(title)
                .font(.title)
                .multilineTextAlignment(.leading)
                .padding(.leading, 40)
            Spacer()
        }
    }
}

#Preview {
    CategoriesView(recordType: .constant(.expense), selectedCategory: .constant(.init(name: "Salary", iconName: "sun.max")))
}
