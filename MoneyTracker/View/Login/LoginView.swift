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
    @State private var showRegistrationView = false
    @State private var showHomeView = false
    
    var body: some View {
        
        VStack {
            /// Login View
            VStack(spacing: 32) {
                Text("Welcome!")
                    .font(.title.bold())
                
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("Username")
                        .font(.callout)
                    CustomTextField(hint: "", value: $username)
                    
                    Text("Password")
                        .font(.callout)
                    CustomTextField(hint: "", value: $password, isPassword: true)
                    
                    HStack {
                        Spacer()
                        Button(action: {}, label: {
                            Text("Forgot password?")
                                .font(.callout)
                        })
                    }
                })
                
                self.loginButton
                    .fullScreenCover(isPresented: $showHomeView) {
                        // TODO: - split for opening after logging in and for saved login data
                        HomeView()
                    }
                
                self.createNewAccountButton
                    .fullScreenCover(isPresented: $showRegistrationView) {
                        RegistrationView()
                    }
            }
            .foregroundStyle(.white)
            .padding(.horizontal, 30)
            .padding(.top, 36)
            .padding(.bottom, 22)
            .background {
                TransparentBlurView(removeAllFilters: true)
                    .blur(radius: 9, opaque: true)
                    .background(.mainNavy.opacity(0.3))
            }
            .clipShape(.rect(cornerRadius: 10, style: .continuous))
            ///Light White Border
            .background {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(.white.opacity(0.4), lineWidth: 1.5)
            }
            /// Adding Shadow
            .shadow(color: .black.opacity(0.4), radius: 10, x: 7, y: 7)
            .padding(.horizontal, 38)
            .background {
                self.backgroundCircle1
                self.backgroundCircle2
                self.backgroundCircle3
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            BackgroundArt()
        }
    }
    
    // MARK: - Views
    
    private var loginButton: some View {
        Button(action: {
            self.showHomeView.toggle()
        }, label: {
            Text("Login")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity)
                .clipShape(.rect(cornerRadius: 8, style: .continuous))
        })
        .background {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(.white.opacity(0.3), lineWidth: 1)
        }
    }
    
    private var createNewAccountButton: some View {
        Button(action: {
            self.showRegistrationView.toggle()
        }, label: {
            Text("Create new account")
                .font(.callout)
        })
    }
    
    /// Background
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
                TextField("", text: value)
                    .autocorrectionDisabled()
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
