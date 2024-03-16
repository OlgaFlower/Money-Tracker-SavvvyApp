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
            Rectangle()
                .fill(.navy)
                .ignoresSafeArea()
            
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
                VStack(spacing: 12) {
                    
                    Text("Registration")
                        .font(.title.bold())
                        .padding(.bottom, 16)
                    
                    VStack(alignment: .leading, spacing: 8, content: {
                        
                        Text("Username")
                            .font(.callout.bold())
                        CustomTextField(hint: "", value: $username)
                        
                        Text("Email")
                            .font(.callout.bold())
                        CustomTextField(hint: "", value: $email)
                        
                        Text("Password")
                            .font(.callout.bold())
                        CustomTextField(hint: "", value: $password, isPassword: true)
                        
                        self.confirmButton
                            .padding(.top, 30)
                    })
                }
                .foregroundStyle(.white)
                .padding(.horizontal, 30)
                .padding(.top, 36)
                .padding(.bottom, 26)
                .background {
                    TransparentBlurView(removeAllFilters: true)
                        .blur(radius: 9, opaque: true)
                        .background(.white.opacity(0.05))
                }
                .clipShape(.rect(cornerRadius: 10, style: .continuous))
                ///Light White Border
                .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(.white.opacity(0.3), lineWidth: 1.5)
                }
                /// Adding Shadow
                .shadow(color: .black.opacity(0.2), radius: 10)
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
                .fontWeight(.semibold)
                .foregroundStyle(.navy)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .background(.white)
                .clipShape(.rect(cornerRadius: 8, style: .continuous))
        })
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
