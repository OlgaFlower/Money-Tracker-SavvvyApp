//
//  MakeNewMoneyRecordViewModel.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 17.05.24.
//

import CoreData
import CoreHaptics

final class MakeNewMoneyRecordViewModel: ObservableObject {
    
    // MARK: - Properties -
    @Published var newItem: MoneyModel = MoneyModel(
        recordType: .expense,
        category: Category(
            moneyGroupType: .none,
            name: "",
            icon: ""
        ),
        moneyAmount: "",
        description: "",
        currency: ""
    )
    @Published var engine: CHHapticEngine?
    
    init() {
        self.newItem = self.setDefaultValues()
    }
    
    // MARK: - Functions
    func setDefaultValues() -> MoneyModel {
        return MoneyModel(
            recordType: .expense,
            category: Category(
                moneyGroupType: .generalExpense,
                name: "CATEGORY",
                icon: "sun.min"
            ),
            moneyAmount: "",
            description: "",
            currency: "EUR"
        )
    }
    
    /// TODO: - FOR TESTING -> create records with past Date() -
    //let pastdate = Calendar.current.date(byAdding: .day, value: -2, to: .now)
    
    func saveNewRecord(_ context: NSManagedObjectContext) {
        
        if let intValue = Int64(self.newItem.moneyAmount),
           self.newItem.category.name != "CATEGORY" {
            
            Money.makeNewRecordWith(
                moneyAmount: intValue,
                currency: self.newItem.currency,
                isIncome: self.newItem.recordType == .income ? true : false,
                categoryName: self.newItem.category.name,
                categoryIcon: self.newItem.category.icon,
                timestamp: Date(),
                notes: self.newItem.description,
                using: context
            )
        }
    }
    
    func isCategoryChosen() -> Bool {
        return self.newItem.category.name != "CATEGORY"
    }
    
    func isSaveBtnActive() -> Bool {
        return self.isCategoryChosen() && !self.newItem.moneyAmount.isEmpty
    }
}

// MARK: - Haptic Engine (Vibrations)
extension MakeNewMoneyRecordViewModel {
    
    func shortVibrate() {
        Constants.vibrateMedium()
    }
    
    func prepareHaptics() {
        do {
            self.engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("An error of creating the Haptics Engine: \(error.localizedDescription)")
        }
    }
    
    func longVibrate() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        var events = [CHHapticEvent]()
        
        // Create a continuous haptic event for a long vibration
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.5)
        let event = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity, sharpness], relativeTime: 0, duration: 0.6)
        
        events.append(event)
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription)")
        }
    }
}
