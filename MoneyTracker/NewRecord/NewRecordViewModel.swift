//
//  NewRecordViewModel.swift
//  Monika
//
//  Created by Olha Bereziuk on 23.12.24.
//

import Foundation

final class NewRecordViewModel: ObservableObject {
    
    @Published var currencySign = UserPreferences.currencySign
    @Published var category: String = ""
    @Published var recurringNumber: Int = 10
}
