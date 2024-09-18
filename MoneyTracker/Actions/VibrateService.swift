//
//  VibrateService.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 18.09.24.
//

import SwiftUI

final class VibrateService {
    
    private init() {}
    
    static func vibrateMedium() {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }
    
    static func vibrateLight() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
    }
}
