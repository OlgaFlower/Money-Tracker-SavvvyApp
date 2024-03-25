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
        self.bankCards.append(BankCardModel(cardCoverImage: Image("art_4"), bankName: "Deutsche Bank", cardholderName: "Patrick", currency: "€"))
        self.bankCards.append(BankCardModel(cardCoverImage: Image("art_1"), bankName: "N26", cardholderName: "YEVA", currency: "€"))
    }
}
