//
//  HomeViewModel.swift
//  Monika
//
//  Created by Olha Bereziuk on 14.03.25.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    func fetchRecords() {
        let records = CoreDataManager.shared.fetchRecords(for: Date())
        print("ALL records: \(records)")
    }
}
