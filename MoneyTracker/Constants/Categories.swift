//
//  Categories.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 14.05.24.
//

import Foundation

struct Category: Hashable {
    let id = UUID()
    let name: String
    let iconName: String
}

final class Categories {
    
    private init() {}
    
    /// Income
    static let permanentIncomeCategories: [Category] = [
        Category(name: "Salary", iconName: "sun.max"),
        Category(name: "Scholarship", iconName: "sunrise"),
        Category(name: "Government aid", iconName: "sunset"),
        Category(name: "Pension", iconName: "sun.horizon"),
        Category(name: "Rent", iconName: "sun.haze")
    ]
    
    static let temporaryIncomeCategories: [Category] = [
        Category(name: "Project based", iconName: "sun.rain"),
        Category(name: "Business revenue", iconName: "sun.snow"),
        Category(name: "Part-time", iconName: "moon"),
        Category(name: "Bonus", iconName: "figure.equestrian.sports"),
        Category(name: "Tips", iconName: "moon.dust.circle"),
        Category(name: "Sale of goods", iconName: "moon.haze.fill"),
        Category(name: "Overtime", iconName: "sparkles"),
        Category(name: "Investment", iconName: "moon.stars"),
        Category(name: "Cash on hand", iconName: "cloud.drizzle"),
        Category(name: "Refund", iconName: "cloud.fog"),
        Category(name: "Tax refund", iconName: "cloud.snow"),
        Category(name: "Debt", iconName: "cloud.bolt")
    ]
    
    /// Expenses
    static let expenses: [Category] = [
        Category(name: "General", iconName: "cloud.sun"),
        Category(name: "Groceries", iconName: "cloud.sun.bolt"),
        Category(name: "Eating Out", iconName: "cloud.moon"),
        Category(name: "Housing", iconName: "wind.snow"),
        Category(name: "Mobility", iconName: "snowflake"),
        Category(name: "Health", iconName: "thermometer.sun"),
        Category(name: "Clothing", iconName: "thermometer.variable.and.figure"),
        Category(name: "Insurance", iconName: "humidity.fill"),
        Category(name: "Education", iconName: "aqi.high"),
        Category(name: "Utilities", iconName: "cloud.rainbow.half"),
        Category(name: "Entertainment", iconName: "carbon.dioxide.cloud"),
        Category(name: "Pets", iconName: "figure.run"),
        Category(name: "Kids", iconName: "figure.archery"),
        Category(name: "Tech", iconName: "figure.badminton"),
        Category(name: "Travel", iconName: "figure.baseball"),
        Category(name: "Tax", iconName: "figure.climbing"),
        Category(name: "Gifts", iconName: "figure.skiing.downhill"),
        Category(name: "Debt refund", iconName: "sun.min")
    ]
    
    // MARK: - Functions
    static func fetchIncomeCategoies() -> (permanent: [Category], temporary: [Category]) {
        return (permanent: self.permanentIncomeCategories, temporary: self.temporaryIncomeCategories)
    }
    
    static func fetchExpenseCategories() -> [Category] {
        return self.expenses
    }
}
