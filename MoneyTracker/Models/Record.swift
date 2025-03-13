//
//  Record.swift
//  Monika
//
//  Created by Olha Bereziuk on 13.03.25.
//

import Foundation

struct Record {
    var id: UUID = UUID()
    var categoryType: CategoryType = .generalExpense
    var category = Category(
        name: "",
        icon: "",
        color: .blue
    )
    var description: String = ""
}
