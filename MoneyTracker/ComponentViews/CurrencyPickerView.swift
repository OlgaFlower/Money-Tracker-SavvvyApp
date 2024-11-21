//
//  CurrencyPickerView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 21.11.24.
//

import SwiftUI

struct CurrencyPickerView: View {
    // MARK: - States
    @Binding var selectedCurrency: String
    @Binding var isPresented: Bool
    @State private var tempCurrency: String
    
    // MARK: - Properties
    var sortedCurrencies: [Currency] {
        Currency.allCases.sorted { $0.rawValue < $1.rawValue }
    }
    
    // MARK: - Init
    init(
        selectedCurrency: Binding<String>,
        isPresented: Binding<Bool>
    ) {
        self._selectedCurrency = selectedCurrency
        self._isPresented = isPresented
        self._tempCurrency = State(initialValue: selectedCurrency.wrappedValue)
    }
    
    // MARK: - Body
    var body: some View {
        VStack {
            ZStack {
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: UIScreen.main.bounds.size.width - 90, height: 28)
                    .foregroundColor(.lightBlue)
                
                Picker("Currency", selection: $tempCurrency) {
                    
                    ForEach(self.sortedCurrencies) { currency in
                        Text(currency.rawValue)
                            .tag(currency)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .labelsHidden()
                .padding()
            }
            
            HStack {
                
                Button("CANCEL") {
                    isPresented.toggle()
                }
                .font(.customFont(style: .regular, size: .body))
                .foregroundColor(.white.opacity(0.9))
                .padding(.leading, 42)
                
                Spacer()
                
                Button("UPDATE") {
                    self.selectedCurrency = self.tempCurrency
                    isPresented.toggle()
                }
                .font(.customFont(style: .medium, size: .body))
                .foregroundColor(.white.opacity(0.9))
                .padding(.trailing, 42)
            }
            .padding(.bottom)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(.white.opacity(0.1))
                .stroke(.white.opacity(0.1), lineWidth: 1)
                .padding(.horizontal)
        )
        .cornerRadius(12)
        .shadow(radius: 10)
        .colorScheme(.dark)
    }
}

#Preview {
    CurrencyPickerView(
        selectedCurrency: .constant(Currency.eur.rawValue),
        isPresented: .constant(true)
    )
}
