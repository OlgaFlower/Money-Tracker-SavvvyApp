//
//  RecurringExpenses.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 21.05.24.
//

import Foundation

enum RecurringExpenses {
    case savings
    case housing
    case tech
    case entertainment
    case utilities
    case health
    case car
    case mobility
    case food
    case insurance
    case education
    case kids
    case pets
    
    var sectionTitle: String {
        switch self {
        case .savings: return "SAVINGS"
        case .housing: return "HOUSING"
        case .tech: return "TECH"
        case .entertainment: return "ENTERTAINMENT"
        case .utilities: return "UTILITIES"
        case .health: return "HEALTH"
        case .car: return "CAR"
        case .mobility: return "MOBILITY"
        case .food: return "FOOD"
        case .insurance: return "INSURANCE"
        case .education: return "EDUCATION"
        case .kids: return "KIDS"
        case .pets: return "PETS"
        }
    }
    
    var items: [Category_old] {
        switch self {
        case .savings:
            return [
                Category_old(
                    moneyGroupType: .recurringExpense,
                    name: "Moneybox",
                    icon: "diamond.lefthalf.filled")
            ]
        case .housing:
            return [
                Category_old(
                    moneyGroupType: .recurringExpense,
                    name: "Rent",
                    icon: "house"),
                Category_old(
                    moneyGroupType: .recurringExpense,
                    name: "Mortgage",
                    icon: "house"),
                Category_old(
                    moneyGroupType: .recurringExpense,
                    name: "Property tax",
                    icon: "house")
            ]
        case .tech:
            return [
                Category_old(
                    moneyGroupType: .recurringExpense,
                    name: "Cell phone",
                    icon: "phone.badge.waveform"),
                Category_old(
                    moneyGroupType: .recurringExpense,
                    name: "iCloud+",
                    icon: "phone.badge.waveform"),
                Category_old(
                    moneyGroupType: .recurringExpense,
                    name: "Google Drive",
                    icon: "phone.badge.waveform"),
                Category_old(
                    moneyGroupType: .recurringExpense,
                    name: "Google Photo",
                    icon: "phone.badge.waveform")
            ]
        case .entertainment:
            return [
                Category_old(
                    moneyGroupType: .recurringExpense,
                    name: "Apple Music",
                    icon: "film.stack"),
                Category_old(
                    moneyGroupType: .recurringExpense,
                    name: "Netflix",
                    icon: "film.stack")
//                Category(
//                    moneyGroupType: .recurringExpense,
//                    name: "Youtube Premium",
//                    icon: "film.stack"),
//                Category(
//                    moneyGroupType: .recurringExpense,
//                    name: "Amazon Prime",
//                    icon: "film.stack"),
//                Category(
//                    moneyGroupType: .recurringExpense,
//                    name: "Spotify",
//                    icon: "film.stack"),
//                Category(
//                    moneyGroupType: .recurringExpense,
//                    name: "News",
//                    icon: "film.stack"),
//                Category(
//                    moneyGroupType: .recurringExpense,
//                    name: "Hobbies",
//                    icon: "film.stack")
            ]
        case .utilities:
            return [
                Category_old(
                    moneyGroupType: .recurringExpense,
                    name: "Electricity",
                    icon: "filemenu.and.selection"),
                Category_old(
                    moneyGroupType: .recurringExpense,
                    name: "Water",
                    icon: "filemenu.and.selection")
//                Category(
//                    moneyGroupType: .recurringExpense,
//                    name: "Gas",
//                    icon: "filemenu.and.selection"),
//                Category(
//                    moneyGroupType: .recurringExpense,
//                    name: "Heating",
//                    icon: "filemenu.and.selection")
            ]
        case .health:
            return [
                Category_old(
                    moneyGroupType: .recurringExpense,
                    name: "Health insurance",
                    icon: "stethoscope")
//                Category(
//                    moneyGroupType: .recurringExpense,
//                    name: "Medicines",
//                    icon: "stethoscope"),
//                Category(
//                    moneyGroupType: .recurringExpense,
//                    name: "Gym",
//                    icon: "stethoscope")
            ]
        case .car:
            return [
                Category_old(
                    moneyGroupType: .recurringExpense,
                    name: "Car insurance",
                    icon: "car.side")
//                Category(
//                    moneyGroupType: .recurringExpense,
//                    name: "Parking",
//                    icon: "car.side"),
//                Category(
//                    moneyGroupType: .recurringExpense,
//                    name: "Tax",
//                    icon: "car.side")
            ]
        case .mobility:
            return [
                Category_old(
                    moneyGroupType: .recurringExpense,
                    name: "Month ticket",
                    icon: "tram")
            ]
        case .food:
            return [
                Category_old(
                    moneyGroupType: .recurringExpense,
                    name: "Food service",
                    icon: "fork.knife.circle")
            ]
        case .insurance:
            return [
                Category_old(
                    moneyGroupType: .recurringExpense,
                    name: "Property insurance",
                    icon: "shield.lefthalf.filled")
//                Category(
//                    moneyGroupType: .recurringExpense,
//                    name: "Life insurance",
//                    icon: "shield.lefthalf.filled"),
//                Category(
//                    moneyGroupType: .recurringExpense,
//                    name: "Health insurance",
//                    icon: "shield.lefthalf.filled"),
//                Category(
//                    moneyGroupType: .recurringExpense,
//                    name: "Dental insurance",
//                    icon: "shield.lefthalf.filled")
            ]
        case .education:
            return [
                Category_old(
                    moneyGroupType: .recurringExpense,
                    name: "Tuition",
                    icon: "bubbles.and.sparkles")
            ]
        case .kids:
            return [
                Category_old(
                    moneyGroupType: .recurringExpense,
                    name: "Day care",
                    icon: "figure.and.child.holdinghands")
//                Category(
//                    moneyGroupType: .recurringExpense,
//                    name: "School fee",
//                    icon: "figure.and.child.holdinghands"),
//                Category(
//                    moneyGroupType: .recurringExpense,
//                    name: "Tutor",
//                    icon: "figure.and.child.holdinghands")
            ]
        case .pets:
            return [
                Category_old(
                    moneyGroupType: .recurringExpense,
                    name: "Pet insurance",
                    icon: "pawprint")
            ]
        }
    }
    
    var icon: String {
        switch self {
        case .savings:
            return "diamond.lefthalf.filled"
        case .housing:
            return "house"
        case .tech:
            return "phone.badge.waveform"
        case .entertainment:
            return "film.stack"
        case .utilities:
            return "filemenu.and.selection"
        case .health:
            return "stethoscope"
        case .car:
            return "car.side"
        case .mobility:
            return "tram"
        case .food:
            return "fork.knife.circle"
        case .insurance:
            return "shield.lefthalf.filled"
        case .education:
            return "bubbles.and.sparkles"
        case .kids:
            return "figure.and.child.holdinghands"
        case .pets:
            return "pawprint"
        }
    }
}
