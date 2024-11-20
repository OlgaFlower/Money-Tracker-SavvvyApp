//
//  BorderedTextInputView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 02.11.24.
//

import SwiftUI

struct BorderedTextInputView<T: RawRepresentable & CaseIterable & Identifiable>: View where T.RawValue == String {
    
    // MARK: - States
    @Binding var input: String
    @State private var isEditing = false
    @FocusState private var isFocused: Bool
    
    // MARK: - Properties
    var placeholder: String
    var suggestions: T.Type
    
    var filteredSuggestions: [T] {
        guard !input.isEmpty else { return [] }
        return T.allCases.filter {
            $0.rawValue.lowercased().hasPrefix(input.lowercased())
        }
    }
    
    // MARK: - Action
    var onSelection: ((T) -> Void)?
    
    // MARK: - Body
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(
                            .white.opacity(0.8),
                            lineWidth: 0.5
                        )
                        .frame(height: 50)
                    
                    if input.isEmpty {
                        Text(placeholder.uppercased())
                            .foregroundStyle(.white.opacity(self.input.isEmpty ?  0.3 : 0))
                            .padding(.leading, 32)
                    }
                    
                    TextField("", text: self.$input, onEditingChanged: { editing in
                        self.isEditing = editing
                    })
                        .textInputAutocapitalization(.characters)
                        .textCase(.uppercase)
                        .autocorrectionDisabled(true)
                        .foregroundStyle(.white.opacity(0.8))
                        .padding(.leading, 32)
                        .focused($isFocused)
                }
                
                if self.isEditing && !self.filteredSuggestions.isEmpty {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(self.filteredSuggestions) { suggestion in
                                
                                Text(suggestion.rawValue.uppercased())
                                    .foregroundColor(.white)
                                    .padding(.vertical, 6)
                                    .padding(.horizontal, 8)
                                    .onTapGesture {
                                        input = suggestion.rawValue
                                        self.isEditing = false
                                        self.isFocused = false
                                        onSelection?(suggestion)
                                    }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: 120)
                    .background(.black.opacity(0.1))
                    .cornerRadius(10)
                    .scrollIndicators(.hidden)
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    BorderedTextInputView<Country>(
        input: .constant(""),
        placeholder: "your country name",
        suggestions: Country.self
    )
}
