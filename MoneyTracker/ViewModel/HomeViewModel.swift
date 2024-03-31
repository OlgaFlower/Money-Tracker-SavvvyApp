//
//  HomeViewModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 25.03.24.
//

import SwiftUI

class BankAccountsViewModel: ObservableObject {
    
    @Published var bankCards: [BankCardModel] = []
    
    // TODO: - Remove bank card mock
    init() {
        self.bankCards.append(BankCardModel(cardCoverImage: Image("art_4"), bankName: "DeutscheBank", cardholderName: "Housekeeping", cardType: .debit, balance: 1365.34, currency: Country.euro.currencySymbol))
        self.bankCards.append(BankCardModel(cardCoverImage: Image("art_7"), bankName: "N26", cardholderName: "YEVA", cardType: .debit, balance: 95.85, currency: Country.euro.currencySymbol))
        self.bankCards.append(BankCardModel(cardCoverImage: Image("art_5"), bankName: "Sparkasse", cardholderName: "Olha", cardType: .moneybox, balance: 2500.00, currency: Country.euro.currencySymbol))
        self.bankCards.append(BankCardModel(cardCoverImage: Image("art_6"), bankName: "UkrsibBank", cardholderName: "Parents", cardType: .debt, balance: -250.00, currency: Country.euro.currencySymbol))
    }
}
