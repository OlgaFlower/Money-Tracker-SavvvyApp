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
    @Binding var scale: CGFloat
    @State private var tempItem: T
    
    // MARK: - Properties
    let items: [T]
    
    // MARK: - Init
    init(
        selectedItem: Binding<T>,
        isPresented: Binding<Bool>,
        scale: Binding<CGFloat>,
        items: [T]
    ) {
        self._selectedItem = selectedItem
        self._isPresented = isPresented
        self._tempItem = State(initialValue: selectedItem.wrappedValue)
        self._scale = scale
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
                    self.scalePicker()
                }
                .font(.customFont(style: .regular, size: .body))
                .foregroundColor(.white.opacity(0.9))
                .padding(.leading, 42)
                
                Spacer()
                
                Button("UPDATE") {
                    self.scalePicker()
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
        .scaleEffect(self.scale)
        .animation(.easeInOut(duration: 0.3), value: self.scale)
    }
    
    // MARK: - Functions
    private func scalePicker() {
        self.scale = 0
        self.selectedItem = self.tempItem
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.isPresented.toggle()
            self.scale = 1
        }
    }
}

#Preview {
    GenericPickerView(
        selectedItem: .constant(Currency.eur),
        isPresented: .constant(true), 
        scale: .constant(0),
        items: Currency.allCases
    )
}
