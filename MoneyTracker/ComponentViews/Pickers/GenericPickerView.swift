//
//  GenericPickerView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 21.11.24.
//

import SwiftUI

struct GenericPickerView<T: PickerItem & Hashable>: View {
    // MARK: - States
    @Binding var selectedItem: T
    @Binding var isPresented: Bool
    @State private var tempItem: T
    
    // MARK: - Properties
    let items: [T]
    
    // MARK: - Init
    init(
        selectedItem: Binding<T>,
        isPresented: Binding<Bool>,
        items: [T]
    ) {
        self._selectedItem = selectedItem
        self._isPresented = isPresented
        self._tempItem = State(initialValue: selectedItem.wrappedValue)
        self.items = items
    }
    
    // MARK: - Body
    var body: some View {
        VStack {
            ZStack {
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: UIScreen.main.bounds.size.width - 84, height: 36)
                    .foregroundColor(.lightBlue)
                
                Picker("", selection: $tempItem) {
                    ForEach(items) { item in
                        Text(item.rawValue)
                            .tag(item)
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
                    self.selectedItem = self.tempItem
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
    GenericPickerView(
        selectedItem: .constant(Currency.eur),
        isPresented: .constant(true),
        items: Currency.allCases
    )
}
