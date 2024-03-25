//
//  BankCardModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 25.03.24.
//

import SwiftUI

struct BankCardModel: Identifiable {
    let id = UUID()
    let cardCoverImage: Image?
    let cardCoverColor: Color? = .gray
    
    let bankName: String?
    let cardholderName: String?
    let balance: Double = 0.00
    let currency: String
}
