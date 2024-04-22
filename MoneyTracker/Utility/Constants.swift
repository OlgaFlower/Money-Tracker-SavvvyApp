//
//  Constants.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 22.04.24.
//

import SwiftUI

final class Constants {
    
    static let shared = Constants()
    let screenWidth: CGFloat
    
    private init() {
        self.screenWidth = UIScreen.main.bounds.width
    }
}
