//
//  IncomeModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 06.04.24.
//

import Foundation

enum RegularIncome_Old: String {
    case salary
    case scholarship
    case governmentAid
    case pension
    case rent
  
    var string: String {
        switch self {
        case .salary: "Salary"
        case .scholarship: "Scholarship"
        case .governmentAid: "Government aid"
        case .pension: "Pension"
        case .rent: "Rent"
        }
    }
    
    var icon: String {
        switch self {
        case .salary: "heart.circle"
        case .scholarship: "bubbles.and.sparkles"
        case .governmentAid: "syringe"
        case .pension: "cross.case.circle"
        case .rent: "homekit"
        }
    }
}
