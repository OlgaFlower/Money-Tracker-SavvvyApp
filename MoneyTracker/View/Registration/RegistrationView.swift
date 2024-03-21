//
//  RegistrationView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 16.03.24.
//

import SwiftUI

struct RegistrationView: View {
    
    // MARK: - Properties
    @Environment(\.dismiss) var dismiss
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var email: String = ""
    
    var body: some View {
        
        ZStack {
            /// Background
            BackgroundGradientView()
            
            /// X Button
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.white)
                            .padding(.trailing, 38)
                    })
                }
                .padding(.top, 30)
                Spacer()
            }
            
            VStack {
                /// Registration View
                VStack(spacing: 32) {
                    Text("Registration")
                        .font(.title.bold())
                    
                    VStack(alignment: .leading, spacing: 8, content: {
                        Text("Username")
                            .font(.callout)
                        CustomTextField(hint: "", value: $username)
                        
                        Text("Email")
                            .font(.callout)
                        CustomTextField(hint: "", value: $email)
                        
                        Text("Password")
                            .font(.callout)
                        CustomTextField(hint: "", value: $password, isPassword: true)
                    })
                    self.confirmButton
                }
                .foregroundStyle(.white)
                .padding(.horizontal, 30)
                .padding(.top, 36)
                .padding(.bottom, 32)
                .background {
                    TransparentBlurView(removeAllFilters: true)
                        .blur(radius: 9, opaque: true)
                        .background(.mainNavy.opacity(0.15))
                }
                .clipShape(.rect(cornerRadius: 10, style: .continuous))
                ///Light White Border
                .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(.white.opacity(0.4), lineWidth: 1)
                }
                /// Adding Shadow
                .shadow(color: .black.opacity(0.4), radius: 10, x: 7, y: 7)
                .padding(.horizontal, 38)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    // MARK: - Views
    
    private var confirmButton: some View {
        Button(action: {
            // TODO: - Save Data
            dismiss()
        }, label: {
            Text("Confirm")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity)
                .clipShape(.rect(cornerRadius: 8, style: .continuous))
        })
        .background {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(.white.opacity(0.3), lineWidth: 1)
        }
    }
    
    /// Custom Text Field
    @ViewBuilder
    func CustomTextField(hint: String, value: Binding<String>, isPassword: Bool = false) -> some View {
        Group {
            if isPassword {
                SecureField(hint, text: value)
            } else {
                TextField(hint, text: value)
            }
        }
        .environment(\.colorScheme, .dark)
        .padding(.vertical, 10)
        .padding(.horizontal, 15)
        .background(.white.opacity(0.12))
        .clipShape(.rect(cornerRadius: 8, style: .continuous))
    }
}

#Preview {
    RegistrationView()
}
