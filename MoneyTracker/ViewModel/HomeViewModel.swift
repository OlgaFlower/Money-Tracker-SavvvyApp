//
//  HomeViewModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 25.03.24.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var bankCards: [BankCardModel] = []
    
    // TODO: - Remove bank card mock
    init() {
        self.bankCards.append(BankCardModel(cardCoverImage: Image("art_4"), bankName: "Deutsche Bank", cardholderName: "Housekeeping", balance: 1365.3498, currency: "€"))
        self.bankCards.append(BankCardModel(cardCoverImage: Image("art_1"), bankName: "N26", cardholderName: "YEVA", balance: 95.85456, currency: "€"))
    }
}
