//
//  Categories.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 14.05.24.
//

import Foundation

struct RecurringCategories: Hashable {
    let id = UUID()
    let sectionTitle: String
    let categoryItems: [Category]
}

struct MoneyCategories: Hashable {
    let id = UUID()
    let categoryItems: [Category]
}

struct Category: Hashable {
    var moneyGroupType: MoneyGroupType
    var name: String
    var icon: String
    
    static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.moneyGroupType == rhs.moneyGroupType &&
        lhs.name == rhs.name &&
        lhs.icon == rhs.icon
    }
}

final class Categories {
    
    private init() {}
    
    // MARK: - Regular Income -
    static let regularIncomeItems: [Category] = [
        Category(
            moneyGroupType: .regularIncome,
            name: RegularIncome.salary.string,
            icon: RegularIncome.salary.icon
        ),
        Category(
            moneyGroupType: .regularIncome,
            name: RegularIncome.scholarship.string,
            icon: RegularIncome.scholarship.icon
        ),
        Category(
            moneyGroupType: .regularIncome,
            name: RegularIncome.governmentAid.string,
            icon: RegularIncome.governmentAid.icon
        ),
        Category(
            moneyGroupType: .regularIncome,
            name: RegularIncome.pension.string,
            icon: RegularIncome.pension.icon
        ),
        Category(
            moneyGroupType: .regularIncome,
            name: RegularIncome.rent.string,
            icon: RegularIncome.rent.icon
        )
    ]
    
    // MARK: - Temporary Income -
    static let temporaryIncomeItems: [Category] = [
        Category(
            moneyGroupType: .temporaryIncome,
            name: TemporaryIncome.project.string,
            icon: TemporaryIncome.project.icon
        ),
        Category(
            moneyGroupType: .temporaryIncome,
            name: TemporaryIncome.business.string,
            icon: TemporaryIncome.business.icon
        ),
        Category(
            moneyGroupType: .temporaryIncome,
            name: TemporaryIncome.partTime.string,
            icon: TemporaryIncome.partTime.icon
        ),
        Category(
            moneyGroupType: .temporaryIncome,
            name: TemporaryIncome.bonus.string,
            icon: TemporaryIncome.bonus.icon
        ),
        Category(
            moneyGroupType: .temporaryIncome,
            name: TemporaryIncome.sale.string,
            icon: TemporaryIncome.sale.icon
        ),
        Category(
            moneyGroupType: .temporaryIncome,
            name: TemporaryIncome.overtime.string,
            icon: TemporaryIncome.overtime.icon
        ),
        Category(
            moneyGroupType: .temporaryIncome,
            name: TemporaryIncome.investment.string,
            icon: TemporaryIncome.investment.icon
        ),
        Category(
            moneyGroupType: .temporaryIncome,
            name: TemporaryIncome.cashOnHand.string,
            icon: TemporaryIncome.cashOnHand.icon
        ),
        Category(
            moneyGroupType: .temporaryIncome,
            name: TemporaryIncome.taxRefund.string,
            icon: TemporaryIncome.taxRefund.icon
        ),
        Category(
            moneyGroupType: .temporaryIncome,
            name: TemporaryIncome.freelance.string,
            icon: TemporaryIncome.freelance.icon
        ),
        Category(
            moneyGroupType: .temporaryIncome,
            name: TemporaryIncome.debt.string,
            icon: TemporaryIncome.debt.icon
        )
    ]
    
    // MARK: - General Expenses -
    static let generalExpenseItems: [Category] = [
        Category(
            moneyGroupType: .generalExpense,
            name: GeneralExpenses.general.string,
            icon: GeneralExpenses.general.icon
        ),
        Category(
            moneyGroupType: .generalExpense,
            name: GeneralExpenses.groceries.string,
            icon: GeneralExpenses.groceries.icon
        ),
        Category(
            moneyGroupType: .generalExpense,
            name: GeneralExpenses.eatingOut.string,
            icon: GeneralExpenses.eatingOut.icon
        ),
        Category(
            moneyGroupType: .generalExpense,
            name: GeneralExpenses.housing.string,
            icon: GeneralExpenses.housing.icon
        ),
        Category(
            moneyGroupType: .generalExpense,
            name: GeneralExpenses.mobility.string,
            icon: GeneralExpenses.mobility.icon
        ),
        Category(
            moneyGroupType: .generalExpense,
            name: GeneralExpenses.health.string,
            icon: GeneralExpenses.health.icon
        ),
        Category(
            moneyGroupType: .generalExpense,
            name: GeneralExpenses.clothing.string,
            icon: GeneralExpenses.clothing.icon
        ),
        Category(
            moneyGroupType: .generalExpense,
            name: GeneralExpenses.insurance.string,
            icon: GeneralExpenses.insurance.icon
        ),
        Category(
            moneyGroupType: .generalExpense,
            name: GeneralExpenses.education.string,
            icon: GeneralExpenses.education.icon
        ),
        Category(
            moneyGroupType: .generalExpense,
            name: GeneralExpenses.utilities.string,
            icon: GeneralExpenses.utilities.icon
        ),
        Category(
            moneyGroupType: .generalExpense,
            name: GeneralExpenses.entertainment.string,
            icon: GeneralExpenses.entertainment.icon
        ),
        Category(
            moneyGroupType: .generalExpense,
            name: GeneralExpenses.pets.string,
            icon: GeneralExpenses.pets.icon
        ),
        Category(
            moneyGroupType: .generalExpense,
            name: GeneralExpenses.kids.string,
            icon: GeneralExpenses.kids.icon
        ),
        Category(
            moneyGroupType: .generalExpense,
            name: GeneralExpenses.tech.string,
            icon: GeneralExpenses.tech.icon
        ),
        Category(
            moneyGroupType: .generalExpense,
            name: GeneralExpenses.travel.string,
            icon: GeneralExpenses.travel.icon
        ),
        Category(
            moneyGroupType: .generalExpense,
            name: GeneralExpenses.tax.string,
            icon: GeneralExpenses.tax.icon
        ),
        Category(
            moneyGroupType: .generalExpense,
            name: GeneralExpenses.gifts.string,
            icon: GeneralExpenses.gifts.icon
        ),
        Category(
            moneyGroupType: .generalExpense,
            name: GeneralExpenses.debtRefund.string,
            icon: GeneralExpenses.debtRefund.icon
        )
    ]
    
    // MARK: - Recurring Expenses
    static let recurringExpenseItems: [RecurringCategories] = [
        RecurringCategories(
            sectionTitle: RecurringExpenses.savings.sectionTitle,
            categoryItems: RecurringExpenses.savings.items),
        RecurringCategories(
            sectionTitle: RecurringExpenses.housing.sectionTitle,
            categoryItems: RecurringExpenses.housing.items),
        RecurringCategories(
            sectionTitle: RecurringExpenses.tech.sectionTitle,
            categoryItems: RecurringExpenses.tech.items),
        RecurringCategories(
            sectionTitle: RecurringExpenses.entertainment.sectionTitle,
            categoryItems: RecurringExpenses.entertainment.items),
        RecurringCategories(
            sectionTitle: RecurringExpenses.utilities.sectionTitle,
            categoryItems: RecurringExpenses.utilities.items),
        RecurringCategories(
            sectionTitle: RecurringExpenses.health.sectionTitle,
            categoryItems: RecurringExpenses.health.items),
        RecurringCategories(
            sectionTitle: RecurringExpenses.car.sectionTitle,
            categoryItems: RecurringExpenses.car.items),
        RecurringCategories(
            sectionTitle: RecurringExpenses.mobility.sectionTitle,
            categoryItems: RecurringExpenses.mobility.items),
        RecurringCategories(
            sectionTitle: RecurringExpenses.food.sectionTitle,
            categoryItems: RecurringExpenses.food.items),
        RecurringCategories(
            sectionTitle: RecurringExpenses.insurance.sectionTitle,
            categoryItems: RecurringExpenses.insurance.items),
        RecurringCategories(
            sectionTitle: RecurringExpenses.education.sectionTitle,
            categoryItems: RecurringExpenses.education.items),
        RecurringCategories(
            sectionTitle: RecurringExpenses.kids.sectionTitle,
            categoryItems: RecurringExpenses.kids.items),
        RecurringCategories(
            sectionTitle: RecurringExpenses.pets.sectionTitle,
            categoryItems: RecurringExpenses.pets.items)
    ]
    
    // MARK: - Functions -
    /// INCOME
    static func fetchRegularIncomeCategories() -> MoneyCategories {
        MoneyCategories(
            categoryItems: regularIncomeItems
        )
    }
    
    static func fetchTemporaryIncomeCategories() -> MoneyCategories {
        MoneyCategories(
            categoryItems: temporaryIncomeItems
        )
    }
    /// EXPENSES
    static func fetchGeneralExpensesItems() -> MoneyCategories {
        MoneyCategories(
            categoryItems: generalExpenseItems
        )
    }
    
    static func fetchRecurringExpenses() -> [RecurringCategories] {
        return recurringExpenseItems
    }
}
