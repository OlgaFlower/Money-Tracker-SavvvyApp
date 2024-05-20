//
//  Categories.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 14.05.24.
//

import Foundation

struct MoneyCategories: Hashable {
    let id = UUID()
    let title: String
    let categoryItems: [Category]
}

struct Category: Hashable {
    var name: String
    var iconName: String
}

final class Categories {
    
    private init() {}
    
    //MARK: - Income -
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
    
    // MARK: - Expenses -
    static let expenses: [Category] = [
        Category(name: "General", iconName: "cloud.sun"),
        Category(name: "Groceries", iconName: "cloud.sun.bolt"),
        Category(name: "Eating Out", iconName: "cloud.moon"),
        Category(name: "Housing", iconName: "wind.snow"),
        Category(name: "Mobility", iconName: "cube.transparent"),
        Category(name: "Car", iconName: "car"),
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
    
    //MARK: - Recurring Expenses -
    static let recurringHousingExpenses: [Category] = [
        Category(name: "Rent", iconName: "house"),
        Category(name: "Mortgage", iconName: "house"),
        Category(name: "Property tax", iconName: "house")
    ]
    
    static let recurringTechExpenses: [Category] = [
        Category(name: "Cell phone", iconName: "phone.badge.waveform"),
        Category(name: "iCloud+", iconName: "phone.badge.waveform"),
        Category(name: "Google Drive", iconName: "phone.badge.waveform"),
        Category(name: "Google Photo", iconName: "phone.badge.waveform")
    ]
    
    static let recurringEntertainmentExpenses: [Category] = [
        Category(name: "Apple Music", iconName: "film.stack"),
        Category(name: "Netflix", iconName: "film.stack"),
        Category(name: "Youtube Premium", iconName: "film.stack"),
        Category(name: "Amazon Prime", iconName: "film.stack"),
        Category(name: "Spotify", iconName: "film.stack"),
        Category(name: "Hobbies", iconName: "film.stack"),
        Category(name: "News", iconName: "film.stack"),
        Category(name: "Wi-Fi", iconName: "film.stack")
    ]
    
    static let recurringUtilitiesExpenses: [Category] = [
        Category(name: "Electricity", iconName: "filemenu.and.selection"),
        Category(name: "Water", iconName: "filemenu.and.selection"),
        Category(name: "Gas", iconName: "filemenu.and.selection"),
        Category(name: "Heating", iconName: "filemenu.and.selection")
    ]
    
    static let recurringHealthExpenses: [Category] = [
        Category(name: "Health insurance", iconName: "stethoscope"),
        Category(name: "Medicines", iconName: "stethoscope"),
        Category(name: "Gym", iconName: "stethoscope")
    ]
    
    static let recurringCarExpenses: [Category] = [
        Category(name: "Car insurance", iconName: "car.side"),
        Category(name: "Parking", iconName: ""),
        Category(name: "Tax", iconName: "")
    ]
    
    static let recurringMobilityExpenses: [Category] = [
        Category(name: "Month ticket", iconName: "tram")
    ]
    
    static let recurringFoodExpenses: [Category] = [
        Category(name: "Food service", iconName: "fork.knife.circle")
    ]
    
    static let recurringInsuranceExpenses: [Category] = [
        Category(name: "Property insurance", iconName: "shield.lefthalf.filled"),
        Category(name: "Life insurance", iconName: "shield.lefthalf.filled"),
        Category(name: "Health insurance", iconName: "shield.lefthalf.filled"),
        Category(name: "Dental insurance", iconName: "shield.lefthalf.filled")
    ]
    
    static let recurringEducationExpenses: [Category] = [
        Category(name: "Tuition", iconName: "bubbles.and.sparkles")
    ]
    
    static let recurringKidsExpenses: [Category] = [
        Category(name: "Day care", iconName: "figure.and.child.holdinghands"),
        Category(name: "School fee", iconName: "figure.and.child.holdinghands"),
        Category(name: "Tutor", iconName: "figure.and.child.holdinghands"),
    ]
    
    static let recurringPetsExpenses: [Category] = [
        Category(name: "Pet insurance", iconName: "pawprint")
    ]
    
    // MARK: - Properties -
    static let income: [MoneyCategories] = [
        MoneyCategories(
            title: "Permanent",
            categoryItems: permanentIncomeCategories
        ),
        MoneyCategories(
            title: "Temporary",
            categoryItems: temporaryIncomeCategories
        )
    ]
    
    static let generalExpenses: MoneyCategories = MoneyCategories(
        title: "General",
        categoryItems: expenses
    )
    
    static let recurringExpenses: [MoneyCategories] = [
        MoneyCategories(
            title: "Housing",
            categoryItems: recurringHousingExpenses
        ),
        MoneyCategories(
            title: "Tech",
            categoryItems: recurringTechExpenses
        ),
        MoneyCategories(
            title: "Entertainment",
            categoryItems: recurringEntertainmentExpenses
        ),
        MoneyCategories(
            title: "Utilities",
            categoryItems: recurringUtilitiesExpenses
        ),
        MoneyCategories(
            title: "Health",
            categoryItems: recurringHealthExpenses
        ),
        MoneyCategories(
            title: "Car",
            categoryItems: recurringCarExpenses
        ),
        MoneyCategories(
            title: "Mobility",
            categoryItems: recurringMobilityExpenses
        ),
        MoneyCategories(
            title: "Food",
            categoryItems: recurringFoodExpenses
        ),
        MoneyCategories(
            title: "Insurance",
            categoryItems: recurringInsuranceExpenses
        ),
        MoneyCategories(
            title: "Education",
            categoryItems: recurringEducationExpenses
        ),
        MoneyCategories(
            title: "Kids",
            categoryItems: recurringKidsExpenses
        ),
        MoneyCategories(
            title: "Pets",
            categoryItems: recurringPetsExpenses
        )
    ]
    
    // MARK: - Functions
    static func fetchIncomeCategories() -> [MoneyCategories] {
        return self.income
    }
    
    static func fetchExpenseCategories() -> [Category] {
        return self.expenses
    }
    
    static func fetchRecurringExpenseCategories() -> [MoneyCategories] {
        return self.recurringExpenses
    }
}
