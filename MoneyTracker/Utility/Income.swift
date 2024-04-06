//
//  Income.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 06.04.24.
//

import Foundation

class Income {
    
    static let shared = Income()
    private init() {}
    
    let incomeRegular: [IncomeModel] = [
        IncomeModel(title: RegularIncome.salary.title, icon: RegularIncome.salary.icon),
        IncomeModel(title: RegularIncome.scholarship.title, icon: RegularIncome.scholarship.icon),
        IncomeModel(title: RegularIncome.governmentAid.title, icon: RegularIncome.governmentAid.icon),
        IncomeModel(title: RegularIncome.pension.title, icon: RegularIncome.pension.icon),
        IncomeModel(title: RegularIncome.rent.title, icon: RegularIncome.rent.icon)
    ]
    
    let incomeTemporary: [IncomeModel] = [
        IncomeModel(title: TemporaryIncome.project.title, icon: TemporaryIncome.project.icon),
        IncomeModel(title: TemporaryIncome.business.title, icon: TemporaryIncome.business.icon),
        IncomeModel(title: TemporaryIncome.partTime.title, icon: TemporaryIncome.partTime.icon),
        IncomeModel(title: TemporaryIncome.bonus.title, icon: TemporaryIncome.bonus.icon),
        IncomeModel(title: TemporaryIncome.sale.title, icon: TemporaryIncome.sale.icon),
        IncomeModel(title: TemporaryIncome.overtime.title, icon: TemporaryIncome.overtime.icon),
        IncomeModel(title: TemporaryIncome.investment.title, icon: TemporaryIncome.investment.icon),
        IncomeModel(title: TemporaryIncome.cashOnHand.title, icon: TemporaryIncome.cashOnHand.icon),
        IncomeModel(title: TemporaryIncome.taxRefund.title, icon: TemporaryIncome.taxRefund.icon),
        IncomeModel(title: TemporaryIncome.freelance.title, icon: TemporaryIncome.freelance.icon)
    ]
}
