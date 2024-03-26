//
//  BankCardModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 25.03.24.
//

import SwiftUI

struct BankCardModel: Identifiable {
    let id = UUID()
    var cardCoverImage: Image?
    var cardCoverColor: Color? = .gray
    
    var bankName: String?
    var cardholderName: String?
    var cardType: BankCardType
    var balance: Double = 0.00
    var currency: String
}

enum BankCardType: String {
    case debit = "Debit"
    case credit = "Credit"
    case debt = "Debt"
    case moneybox = "Moneybox"
}
