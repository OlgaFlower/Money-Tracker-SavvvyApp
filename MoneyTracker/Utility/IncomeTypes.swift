//
//  IncomeTypes.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 06.04.24.
//

import Foundation

class IncomeTypes {
    
    static let shared = IncomeTypes()
    private init() {}
    
    let incomeRegular: [IncomeModel] = [
        IncomeModel(incomeRegular: .salary, incomeTemporary: nil),
        IncomeModel(incomeRegular: .scholarship, incomeTemporary: nil),
        IncomeModel(incomeRegular: .governmentAid, incomeTemporary: nil),
        IncomeModel(incomeRegular: .pension, incomeTemporary: nil),
        IncomeModel(incomeRegular: .rent, incomeTemporary: nil)
    ]
    
    let incomeTemporary: [IncomeModel] = [
        IncomeModel(incomeRegular: nil, incomeTemporary: .project),
        IncomeModel(incomeRegular: nil, incomeTemporary: .business),
        IncomeModel(incomeRegular: nil, incomeTemporary: .partTime),
        IncomeModel(incomeRegular: nil, incomeTemporary: .bonus),
        IncomeModel(incomeRegular: nil, incomeTemporary: .sale),
        IncomeModel(incomeRegular: nil, incomeTemporary: .overtime),
        IncomeModel(incomeRegular: nil, incomeTemporary: .investment),
        IncomeModel(incomeRegular: nil, incomeTemporary: .cashOnHand),
        IncomeModel(incomeRegular: nil, incomeTemporary: .taxRefund),
        IncomeModel(incomeRegular: nil, incomeTemporary: .freelance)
    ]
}
