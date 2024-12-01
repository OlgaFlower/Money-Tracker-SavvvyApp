//
//  Settings.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 01.12.24.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - AppStorage
    @AppStorage("userCurrency") var currency: String = "EUR"
    @AppStorage("userCountry") var country: String = "Ukraine"
    @AppStorage("userLanguage") var language: String = "English"
    
    // MARK: - Body
    var body: some View {
        ZStack {
            BackgroundGradView()
            
            VStack {
                self.makeCellFor("language", currentValue: self.language)
                self.makeCellFor("country", currentValue: self.country)
                self.makeCellFor("currency", currentValue: self.currency)
                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.top, 20)
        }
    }
    
    // MARK: - Views
    private func makeCellFor(_ title: String, currentValue: String) -> some View {
        VStack {
            HStack {
                TextSmallView(text: title)
                Spacer()
                Text(currentValue)
                    .foregroundStyle(.white.opacity(0.5))
                    .padding(.trailing, 4)
                Image(systemName: "chevron.right")
                    .foregroundStyle(.white.opacity(0.9))
            }
            .padding(.vertical)
            Rectangle()
                .frame(height: 0.5)
                .foregroundStyle(.white.opacity(0.9))
        }
    }
}

#Preview {
    SettingsView()
}
