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
    var balance: Double = 0.00
    var currency: String
}
