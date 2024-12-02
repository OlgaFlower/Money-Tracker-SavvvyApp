//
//  SettingsDetailedListView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 02.12.24.
//

import SwiftUI

struct SettingsDetailedListView<T: PickerItem & Hashable>: View {
    // MARK: - States
    @Binding var selectedValue: String
    @State private var tempItem: T
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Properties
    let items: [T]
    
    // MARK: - Init
    init(
        items: [T],
        selectedValue: Binding<String>
    ) {
        self.items = items.sorted { $0.rawValue < $1.rawValue }
        self._selectedValue = selectedValue
        self._tempItem = State(initialValue: items.first(where: { $0.rawValue == selectedValue.wrappedValue }) ?? items[0])
    }
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            BackgroundGradView()
            
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(items) { item in
                        TextCellView(item: item.rawValue)
                            .background(tempItem == item ? Color.white.opacity(0.2) : Color.clear)
                            .onTapGesture {
                                self.tempItem = item
                            }
                    }
                }
            }
        }
        .navigationTitle("SELECT \(String(describing: T.self).uppercased())") // TODO: - check for mistakes for each language
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    self.selectedValue = self.tempItem.rawValue
                    dismiss()
                } label: {
                    Text("Done")
                }
            }
        }
    }
}

#Preview {
    SettingsDetailedListView(
        items: Country.allCases,
        selectedValue: .constant("Ukraine")
    )
}
