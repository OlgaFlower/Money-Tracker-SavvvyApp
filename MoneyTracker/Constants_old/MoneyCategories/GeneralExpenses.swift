//
//  GeneralExpenses.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 21.05.24.
//

import Foundation

enum GeneralExpenses {
    case general
    case groceries
    case eatingOut
    case housing
    case mobility
    case health
    case clothing
    case insurance
    case education
    case utilities
    case entertainment
    case pets
    case kids
    case tech
    case travel
    case tax
    case gifts
    case debtRefund
    
    var string: String {
        switch self {
        case .general: return "General"
        case .groceries: return "Groceries"
        case .eatingOut: return "Eating out"
        case .housing: return "Housing"
        case .mobility: return "Mobility"
        case .health: return "Health"
        case .clothing: return "Clothing"
        case .insurance: return "Insurance"
        case .education: return "Education"
        case .utilities: return "Utilities"
        case .entertainment: return "Entertainment"
        case .pets: return "Pets"
        case .kids: return "Kids"
        case .tech: return "Tech"
        case .travel: return "Travel"
        case .tax: return "Tax"
        case .gifts: return "Gifts"
        case .debtRefund: return "Debt refund"
        }
    }
    
    var icon: String {
        switch self {
        case .general:
            return "cloud.sun"
        case .groceries:
            return "cloud.sun.bolt"
        case .eatingOut:
            return "cloud.moon"
        case .housing:
            return "wind.snow"
        case .mobility:
            return "cube.transparent"
        case .health:
            return "thermometer.sun"
        case .clothing:
            return "thermometer.variable.and.figure"
        case .insurance:
            return "humidity.fill"
        case .education:
            return "aqi.high"
        case .utilities:
            return "cloud.rainbow.half"
        case .entertainment:
            return "carbon.dioxide.cloud"
        case .pets:
            return "figure.run"
        case .kids:
            return "figure.archery"
        case .tech:
            return "figure.badminton"
        case .travel:
            return "figure.baseball"
        case .tax:
            return "figure.climbing"
        case .gifts:
            return "figure.skiing.downhill"
        case .debtRefund:
            return "sun.min"
        }
    }
}
