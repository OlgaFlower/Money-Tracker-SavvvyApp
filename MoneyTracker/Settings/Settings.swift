//
//  Settings.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 01.12.24.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - States
    @StateObject private var viewModel = SettingsViewModel()
    @State private var path = NavigationPath()
    
    // MARK: - Body
    var body: some View {
        
        NavigationStack(path: $path) {
            ZStack {
                BackgroundGradView()
                
                VStack {
                    self.makeCellFor("language", currentValue: self.viewModel.tempLanguage)
                    self.makeCellFor("country", currentValue: self.viewModel.tempCountry)
                    self.makeCellFor("currency", currentValue: self.viewModel.tempCurrency)
                    Spacer()
                }
                .padding(.horizontal, 24)
                .padding(.top, 20)
                
                self.saveBtnView
            }
            .navigationDestination(for: String.self) { destination in
                switch destination {
                case "language":
                    SettingsDetailedListView(items: Language.allCases, selectedValue: $viewModel.tempLanguage)
                case "country":
                    SettingsDetailedListView(items: Country.allCases, selectedValue: $viewModel.tempCountry)
                case "currency":
                    SettingsDetailedListView(items: Currency.allCases, selectedValue: $viewModel.tempCurrency)
                default:
                    EmptyView()
                }
            }
        }
        .onAppear {
            self.viewModel.checkForChanges()
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
            .contentShape(Rectangle())
            .onTapGesture {
                self.path.append(title)
            }
            Rectangle()
                .frame(height: 0.5)
                .foregroundStyle(.white.opacity(0.9))
        }
    }
    
    private var saveBtnView: some View {
        VStack {
            Spacer()
            self.saveChangesButton
                .padding(.bottom, 32)
                .opacity(self.viewModel.isButtonActive ? 1 : 0)
        }
    }
    
    private var saveChangesButton: some View {
        Button {
            self.viewModel.saveChanges()
            self.viewModel.isButtonActive.toggle()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.viewModel.vibrate()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.viewModel.vibrate()
                }
            }
        } label: {
            TextView(text: "save", style: .regular)
                .padding(.vertical, 10)
                .frame(width: Constants.buttonWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .fill(.white.opacity(Constants.buttonFillOpacity))
        )
        .disabled(!self.viewModel.isButtonActive)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous)
                .stroke(.white.opacity(Constants.strokeOpacity), lineWidth: 0.5)
        )
    }
}

#Preview {
    SettingsView()
}
