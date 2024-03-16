//
//  LoginView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 15.03.24.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: - Properties
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        
        VStack {
            /// Login View
            VStack(spacing: 12) {
                Text("Welcome!")
                    .font(.title.bold())
                
                VStack(alignment: .leading, spacing: 8, content: {
                    
                    Text("Username")
                        .font(.callout.bold())
                    
                    CustomTextField(hint: "iNick", value: $username)
                    
                    Text("Password")
                        .font(.callout.bold())
                        .padding(.top, 16)
                    
                    CustomTextField(hint: "•••••••", value: $password, isPassword: true)
                    
                    self.loginButton
                        .padding(.top, 30)
                    
                    /// Other Login Options
                    HStack(spacing: 12) {
                        self.loginWithEmailButton
                        
                        self.loginWithAppleButton
                    }
                    .foregroundStyle(.white)
                    .padding(.top, 16)
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
            .background {
                self.backgroundCircle1
                self.backgroundCircle2
                self.backgroundCircle3
            }
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Rectangle()
                .fill(.navy)
                .ignoresSafeArea()
        }
    }
    
    // MARK: - Views
    
    private var loginButton: some View {
        Button(action: {}, label: {
            Text("Login")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.navy)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .background(.white)
                .clipShape(.rect(cornerRadius: 8, style: .continuous))
        })
    }
    
    private var loginWithEmailButton: some View {
        Button(action: {}, label: {
            Label("Email", systemImage: "envelope.fill")
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
            /// Adding Transparent Blur
                .background {
                    TransparentBlurView(removeAllFilters: false)
                        .background(.white.opacity(0.2))
                }
                .clipShape(.rect(cornerRadius: 8, style: .continuous))
        })
    }
    
    private var loginWithAppleButton: some View {
        Button(action: {}, label: {
            Label("Apple", systemImage: "applelogo")
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
            /// Adding Transparent Blur
                .background {
                    TransparentBlurView(removeAllFilters: false)
                        .background(.white.opacity(0.2))
                }
                .clipShape(.rect(cornerRadius: 8, style: .continuous))
        })
    }
    
    private var backgroundCircle1: some View {
        ZStack {
            Circle()
                .fill(
                    .linearGradient(colors: [
                        .gradientTop1,
                        .gradientBottom1
                    ], startPoint: .top, endPoint: .bottom)
                )
                .frame(width: 150, height: 150)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .offset(x: -35, y: -70)
        }
    }
    
    private var backgroundCircle2: some View {
        ZStack {
            Circle()
                .fill(
                    .linearGradient(colors: [
                        .gradientTop2,
                        .gradientBottom2
                    ], startPoint: .top, endPoint: .bottom)
                )
                .frame(width: 130, height: 130)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                .offset(x: 35, y: 45)
        }
    }
    
    private var backgroundCircle3: some View {
        ZStack {
            Circle()
                .fill(
                    .linearGradient(colors: [
                        .gradientTop3,
                        .gradientBottom3
                    ], startPoint: .top, endPoint: .bottom)
                )
                .frame(width: 60, height: 60)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                .offset(x: -25, y: -475)
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
    ContentView()
}
