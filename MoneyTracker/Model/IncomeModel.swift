//
//  IncomeModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 06.04.24.
//

import Foundation

struct IncomeModel: Identifiable {
    let id = UUID()
    let incomeRegular: RegularIncome?
    let incomeTemporary: TemporaryIncome?
}
