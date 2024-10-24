//
//  CalendarDetailsViewModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 07.08.24.
//

import SwiftUI
import CoreData

final class CalendarDetailsViewModel: ObservableObject {
    
    @ObservedObject private var dataService: DataService
    
    // MARK: - Publishers
    @Published var expenses: [MoneyModel] = []
    @Published var income: [MoneyModel] = []
    
    @Binding var selectedDay: Date
    
    // MARK: - Init
    init(
        dataService: DataService = DataService.shared,
        selectedDay: Binding<Date>
    ) {
        self.dataService = dataService
        self._selectedDay = selectedDay
        self.prepareRecords()
    }
    
    // MARK: - Functions
    func prepareRecords() {
        let allRecords = self.dataService.getRecords(for: self.selectedDay)
        self.filterRecords(records: allRecords)
    }
    
    func filterRecords(records: [MoneyModel]) {
        self.income = records.filter { $0.recordType == .income }
        self.expenses = records.filter { $0.recordType == .expense }
    }
    
    func deleteItem(
        recordId: String,
        in viewContext: NSManagedObjectContext
    ) {
        self.dataService.deleteRecord(recordId: recordId, in: viewContext)
    }
}
