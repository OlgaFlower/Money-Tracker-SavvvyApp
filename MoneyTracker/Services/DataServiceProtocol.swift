//
//  DataServiceProtocol.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 01.10.24.
//

import Foundation

protocol DataServiceProtocol: AnyObject, ObservableObject {
    var todayExpensesSum: Int { get }
    var dayBudget: Double { get }
    var todayLeftover: Double { get }
    var todayExpensesRecords: [MoneyModel] { get }
    func updateTodayMoneyValues()
}
