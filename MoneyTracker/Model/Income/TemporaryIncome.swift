//
//  TemporaryIncome.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 06.04.24.
//

import Foundation

enum TemporaryIncome: String {
    case project
    case business
    case partTime
    case bonus
    case sale
    case overtime
    case investment
    case cashOnHand
    case taxRefund
    case freelance
    
    var title: String {
        switch self {
        case .project: "Project"
        case .business: "Business revenue"
        case .partTime: "Part-time"
        case .bonus: "Bonus"
        case .sale: "Sale"
        case .overtime: "Overtime"
        case .investment: "Investment"
        case .cashOnHand: "Cash on hand"
        case .taxRefund: "Tax refund"
        case .freelance: "Freelance"
        }
    }
    
    var icon: String {
        switch self {
            
        case .project: "lightbulb.max"
        case .business: "figure.equestrian.sports"
        case .partTime: "pill"
        case .bonus: "cross.vial"
        case .sale: "staroflife"
        case .overtime: "heart.text.square"
        case .investment: "brain.head.profile"
        case .cashOnHand: "yensign.arrow.circlepath"
        case .taxRefund: "waveform.path.ecg.rectangle"
        case .freelance: "banknote"
        }
    }
}
